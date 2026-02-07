import 'package:get/get.dart';

import 'report_agents_controller.dart';

class ReportAgentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportAgentsController>(
      () => ReportAgentsController(),
    );
  }
}
