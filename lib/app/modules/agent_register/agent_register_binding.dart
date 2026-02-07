import 'package:get/get.dart';

import 'agent_register_controller.dart';

class AgentRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentRegisterController>(
      () => AgentRegisterController(),
    );
  }
}
