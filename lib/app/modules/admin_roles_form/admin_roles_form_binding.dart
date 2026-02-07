import 'package:get/get.dart';

import 'admin_roles_form_controller.dart';

class AdminRolesFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminRolesFormController>(
      () => AdminRolesFormController(),
    );
  }
}
