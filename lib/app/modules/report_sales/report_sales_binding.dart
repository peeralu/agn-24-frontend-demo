import 'package:get/get.dart';

import 'report_sales_controller.dart';

class ReportSalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportSalesController>(
      () => ReportSalesController(),
    );
  }
}
