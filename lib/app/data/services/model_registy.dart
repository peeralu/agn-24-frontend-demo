import 'package:frontend/app/core/model/factory.dart';
import 'package:frontend/app/data/models/models.dart';

class ModelRegistry {
  static Future<void> init() async {
    ModelFactory.register<UserModel>((json) => UserModel.fromJson(json as Map<String, dynamic>));
    ModelFactory.register<Company>((json) => Company.fromJson(json as Map<String, dynamic>));
    ModelFactory.register<Media>((json) => Media.fromJson(json as Map<String, dynamic>));
  }
}
