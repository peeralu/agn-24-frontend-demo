import 'package:get/get.dart';

import 'report_customers_controller.dart';

class ReportCustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportCustomersController>(
      () => ReportCustomersController(),
    );
  }
}
