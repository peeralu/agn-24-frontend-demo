import 'package:frontend/app/data/models/user.dart';
import 'package:frontend/app/data/services/api_service.dart';
import 'package:frontend/app/data/services/auth_service.dart';
import 'package:frontend/app/lib_controller.dart';
import 'package:frontend/app/modules/admin/admin_controller.dart';

class LoginController extends GetxController {
  final authService = AuthService.instance;
  final apiService = ApiService.instance;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  var isLoading = false.obs;
  var obscurePassword = true.obs;

  final imagesIndex = 0.obs;
  final images = [
    'https://agn24.com/assets/1.png',
    'https://agn24.com/assets/3.png',
    'https://agn24.com/assets/4.png',
    'https://agn24.com/assets/5.jpeg',
    'https://agn24.com/assets/6.jpeg',
  ].obs;

  final appVersion = FlavorService.instance.version;

  @override
  void onInit() {
    super.onInit();
  }
}

extension LoginControllerAction on LoginController {
  void onChangeImageIndex(int index) {
    imagesIndex.value = index;
  }

  void onLoginTap() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) {
      AppToast.showWarning(message: "กรุณากรอกข้อมูลให้ครบถ้วน");
      return;
    }

    final username = formKey.currentState?.fields['email']?.value ?? '';
    final password = formKey.currentState?.fields['password']?.value ?? '';

    isLoading.value = true;
    try {
      if (username == 'demo' && password == 'demo') {
        final now = DateTime.now();
        AdminController.instance.user.value = UserModel(
          id: null,
          createdAt: now,
          updatedAt: now,
          isActive: true,
          uid: 'asdasdasd',
          firstName: 'demo',
          lastName: 'demo',
          image: 'demo',
          roles: [
            RoleModel(
              id: 1,
              createdAt: now,
              updatedAt: now,
              isActive: true,
              code: 'ADMIN',
              name: 'Administrator',
              permissions: [],
            ),
          ],
        );
      } else {
        throw UnimplementedError();
      }

      isLoading.value = false;
      AppToast.showSuccess(message: "ยินดีต้อนรับกลับ, $username!");
      Get.offAllNamed(Routes.CUSTOMER_PROFILE);
    } catch (e) {
      isLoading.value = false;
      print(e);
      AppToast.showError(message: "ไม่สามารถเข้าสู่ระบบได้ กรุณาลองใหม่อีกครั้ง");
    }
  }

  void onTogglePasswordVisibilityTap() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onSignUpTap() {
    Get.offAllNamed(Routes.REGISTER);
  }

  void onForgotPasswordTap() {
    Get.offAllNamed(Routes.FORGOT_PASSWORD);
  }
}
