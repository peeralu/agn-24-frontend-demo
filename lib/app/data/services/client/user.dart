part of '../api_service.dart';

extension ApiServiceUserClient on ApiService {
  Future<UserModel> fetchMe() async {
    final path = '/api/v1/users/me';
    return await get<UserModel>(path);
  }

  Future<List<UserModel>> fetchUserList() async {
    final path = '/api/v1/users';
    return await getList<UserModel>(path);
  }
}
