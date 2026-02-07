import 'factory.dart';

abstract class _BaseResponse {
  final String? status;
  final String? code;

  const _BaseResponse({required this.status, required this.code});

  bool get isSuccess => status == 'success' && code == '00000';
}

class BaseResponse<T> extends _BaseResponse {
  final T result;

  const BaseResponse({required super.status, required super.code, required this.result});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json['status'] as String?,
      code: json['code'] as String?,
      result: ModelFactory.fromJson<T>(json['result']),
    );
  }
}

class BaseListResponse<T> extends _BaseResponse {
  final List<T> result;

  BaseListResponse({required super.status, required super.code, required this.result});

  factory BaseListResponse.fromJson(Map<String, dynamic> json) {
    return BaseListResponse(
      status: json['status'] as String?,
      code: json['code'] as String?,
      result: ModelFactory.fromJsonList<T>(json['result']),
    );
  }
}
