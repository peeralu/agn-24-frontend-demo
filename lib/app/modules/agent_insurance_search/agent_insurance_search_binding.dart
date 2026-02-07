import 'package:get/get.dart';

import 'agent_insurance_search_controller.dart';

class AgentInsuranceSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentInsuranceSearchController>(
      () => AgentInsuranceSearchController(),
    );
  }
}
