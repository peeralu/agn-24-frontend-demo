import 'package:get/get.dart';

import 'admin_roles_controller.dart';

class AdminRolesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminRolesController>(
      () => AdminRolesController(),
    );
  }
}
