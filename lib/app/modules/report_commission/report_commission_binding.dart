import 'package:get/get.dart';

import 'report_commission_controller.dart';

class ReportCommissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportCommissionController>(
      () => ReportCommissionController(),
    );
  }
}
