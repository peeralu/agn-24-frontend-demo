import 'package:frontend/app/lib_controller.dart';

class AdminUsersFormController extends GetxController {
  final isLoading = false.obs;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

extension AdminUsersFormControllerAction on AdminUsersFormController {
  Future<void> onUserPage() async {
    await Get.offAllNamed(Routes.ADMIN_USERS);
  }
}
