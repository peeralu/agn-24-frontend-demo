import 'package:get/get.dart';

import 'admin_insurance_controller.dart';

class AdminInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminInsuranceController>(
      () => AdminInsuranceController(),
    );
  }
}
