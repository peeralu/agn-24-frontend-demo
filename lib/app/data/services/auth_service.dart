import 'package:get/get.dart';

class AuthService {
  static AuthService get instance => Get.find<AuthService>();

  static Future<void> init() async {
    Get.putAsync(() async => AuthService(), permanent: true);
  }

  Future<void> signUp(String email, String password) async {}

  Future<dynamic> signIn(String email, String password) async {
    return null;
  }

  Future<void> signOut() async {}
}
