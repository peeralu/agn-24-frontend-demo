import 'package:frontend/app/lib_controller.dart';

import 'main_controller.dart';

class MainController extends GetxController {
  @override
  void onReady() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAuth();
    });
    super.onReady();
  }
}

extension MainControllerAction on MainController {
  Future<void> fetchAuth() async {
    Get.offAllNamed(Routes.LOGIN);
  }
}
