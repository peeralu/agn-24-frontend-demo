import 'package:get/get.dart';

import 'admin_insurance_form_controller.dart';

class AdminInsuranceFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminInsuranceFormController>(
      () => AdminInsuranceFormController(),
    );
  }
}
