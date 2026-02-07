import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DatabaseKey { authToken, profileData }

extension DatabaseKeyExtension on DatabaseKey {
  String get key {
    switch (this) {
      case DatabaseKey.authToken:
        return 'authToken';
      case DatabaseKey.profileData:
        return 'profileData';
    }
  }
}

class Database {
  static SharedPreferences get instance => Get.find<SharedPreferences>();

  static Future<void> init() async {
    Get.putAsync(() => SharedPreferences.getInstance(), permanent: true);
  }
}
