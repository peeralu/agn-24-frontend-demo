import 'package:get/get.dart';

import 'agent_commission_controller.dart';

class AgentCommissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentCommissionController>(
      () => AgentCommissionController(),
    );
  }
}
