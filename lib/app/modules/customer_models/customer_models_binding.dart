import 'package:get/get.dart';

import 'customer_models_controller.dart';

class CustomerModelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerModelsController>(
      () => CustomerModelsController(),
    );
  }
}
