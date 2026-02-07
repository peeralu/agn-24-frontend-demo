import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/admin_controller.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());

    Get.put(AdminController());
  }
}
