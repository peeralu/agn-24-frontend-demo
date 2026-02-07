import 'package:get/get.dart';

import 'wallet_balance_controller.dart';

class WalletBalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletBalanceController>(
      () => WalletBalanceController(),
    );
  }
}
