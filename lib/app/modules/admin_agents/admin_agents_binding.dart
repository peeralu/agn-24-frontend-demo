import 'package:get/get.dart';

import 'admin_agents_controller.dart';

class AdminAgentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAgentsController>(
      () => AdminAgentsController(),
    );
  }
}
