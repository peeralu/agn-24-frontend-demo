import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:frontend/app/core/model/response.dart';
import 'package:frontend/app/data/models/models.dart';

part 'client/user.dart';
part 'client/media.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;

  ApiService({required this.baseUrl, required this.dio});

  static ApiService get instance => Get.find<ApiService>();

  static Future<void> init(String baseUrl) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Accept': 'application/json', 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'},
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
      ),
    );

    // dio.interceptors.add(TokenInterceptor(dio));

    Get.put(ApiService(baseUrl: baseUrl, dio: dio), permanent: true);
  }

  // ---------- GET object ----------
  Future<T> get<T>(String path, {Map<String, dynamic>? query}) async {
    final response = await dio.get(path, queryParameters: query);
    final base = BaseResponse<T>.fromJson(response.data as Map<String, dynamic>);

    if (!base.isSuccess) {
      throw Exception('API error: ${base.code}');
    }

    return base.result;
  }

  // ---------- GET list ----------
  Future<List<T>> getList<T>(String path, {Map<String, dynamic>? query}) async {
    final response = await dio.get(path, queryParameters: query);
    final base = BaseListResponse<T>.fromJson(response.data as Map<String, dynamic>);

    if (!base.isSuccess) {
      throw Exception('API error: ${base.code}');
    }

    return base.result;
  }

  // ---------- POST ----------
  Future<T> post<T>(String path, Object? body) async {
    final response = await dio.post(path, data: body);
    final base = BaseResponse<T>.fromJson(response.data as Map<String, dynamic>);

    if (!base.isSuccess) {
      throw Exception('API error: ${base.code}');
    }

    return base.result;
  }

  // ---------- PUT ----------
  Future<T> put<T>(String path, Object? body) async {
    final response = await dio.put(path, data: body);
    final base = BaseResponse<T>.fromJson(response.data as Map<String, dynamic>);
    if (!base.isSuccess) {
      throw Exception('API error: ${base.code}');
    }
    return base.result;
  }

  // ---------- PATCH ----------
  Future<T> patch<T>(String path, Object? body) async {
    final response = await dio.patch(path, data: body);
    final base = BaseResponse<T>.fromJson(response.data as Map<String, dynamic>);
    if (!base.isSuccess) {
      throw Exception('API error: ${base.code}');
    }
    return base.result;
  }

  // ---------- DELETE ----------
  Future<T> delete<T>(String path) async {
    final response = await dio.delete(path);
    final base = BaseResponse<T>.fromJson(response.data as Map<String, dynamic>);
    if (!base.isSuccess) {
      throw Exception('API error: ${base.code}');
    }
    return base.result;
  }
}
