import 'package:get/get.dart';

import 'admin_reports_controller.dart';

class AdminReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminReportsController>(
      () => AdminReportsController(),
    );
  }
}
