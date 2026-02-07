import 'package:get/get.dart';

import 'report_topup_controller.dart';

class ReportTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportTopupController>(
      () => ReportTopupController(),
    );
  }
}
