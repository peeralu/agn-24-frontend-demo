import 'package:get/get.dart';

import 'agent_customers_controller.dart';

class AgentCustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentCustomersController>(
      () => AgentCustomersController(),
    );
  }
}
