import 'package:get/get.dart';

import 'agent_topup_controller.dart';

class AgentTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentTopupController>(
      () => AgentTopupController(),
    );
  }
}
