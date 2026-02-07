import 'package:get/get.dart';

import 'admin_users_form_controller.dart';

class AdminUsersFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminUsersFormController>(AdminUsersFormController());
  }
}
