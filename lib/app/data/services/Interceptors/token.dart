import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:frontend/app/routes/app_pages.dart';

class TokenInterceptor extends InterceptorsWrapper {
  final Dio dio;

  TokenInterceptor(this.dio);

  bool _isRefreshing = false;
  final List<void Function()> _retryQueue = [];

  Future<String?> _getAccessToken() async {
    return "asdas";
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final requestOptions = err.requestOptions;

    // ป้องกัน infinite loop
    if (requestOptions.extra['retried'] == true) {
      return handler.next(err);
    }

    if (statusCode == 401) {
      if (_isRefreshing) {
        // รอ refresh เสร็จแล้วค่อย retry
        _retryQueue.add(() async {
          final newToken = await _getAccessToken();
          requestOptions.headers['Authorization'] = 'Bearer $newToken';
          requestOptions.extra['retried'] = true;

          final response = await dio.fetch(requestOptions);
          handler.resolve(response);
        });
        return;
      }

      _isRefreshing = true;

      try {
        _isRefreshing = false;

        final newToken = await _getAccessToken();
        requestOptions.headers['Authorization'] = 'Bearer $newToken';
        requestOptions.extra['retried'] = true;

        for (final retry in _retryQueue) {
          retry();
        }
        _retryQueue.clear();

        final response = await dio.fetch(requestOptions);
        return handler.resolve(response);
      } catch (e) {
        _isRefreshing = false;
        _retryQueue.clear();

        // await supabase.auth.signOut();
        Get.offAllNamed(Routes.LOGIN);
        return handler.next(err);
      }
    }

    if (statusCode == 403) {
      // await supabase.auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    }

    handler.next(err);
  }
}
