import 'package:get/get.dart';

import 'admin_customers_controller.dart';

class AdminCustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCustomersController>(
      () => AdminCustomersController(),
    );
  }
}
