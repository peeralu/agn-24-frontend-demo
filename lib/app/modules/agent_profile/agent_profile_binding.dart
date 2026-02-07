import 'package:get/get.dart';

import 'agent_profile_controller.dart';

class AgentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentProfileController>(
      () => AgentProfileController(),
    );
  }
}
