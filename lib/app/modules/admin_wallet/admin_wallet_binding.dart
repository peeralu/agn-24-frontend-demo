import 'package:get/get.dart';

import 'admin_wallet_controller.dart';

class AdminWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminWalletController>(
      () => AdminWalletController(),
    );
  }
}
