import 'package:get/get.dart';

import 'insurance_search_controller.dart';

class InsuranceSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InsuranceSearchController>(
      () => InsuranceSearchController(),
    );
  }
}
