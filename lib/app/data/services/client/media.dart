part of '../api_service.dart';

extension ApiServiceMediaClient on ApiService {
  Future<List<Media>> fetchMediaList() async {
    final path = '/api/v1/media';
    final medias = await getList<Media>(path);
    return medias;
  }
}
