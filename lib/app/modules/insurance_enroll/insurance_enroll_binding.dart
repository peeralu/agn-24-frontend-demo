import 'package:get/get.dart';

import 'insurance_enroll_controller.dart';

class InsuranceEnrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsuranceEnrollController>(
      () => InsuranceEnrollController(),
    );
  }
}
