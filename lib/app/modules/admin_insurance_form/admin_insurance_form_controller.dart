import 'package:get/get.dart';

class AdminInsuranceFormController extends GetxController {
  final id = (-1).obs;

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

  void fetchInsuranceFormData() async {
    final args = Get.arguments;
    final param = Get.parameters;
    try {
      if (args != null) {
        id.value = args as int;
      } else if (param.containsKey('id')) {
        id.value = int.parse(param['id']!);
      } else {}
    } catch (e) {
      id.value = -1;
    }
  }
}

extension AdminInsuranceFormControllerAction on AdminInsuranceFormController {
  Future<void> fetchForm(int id) async {
    // ดึงข้อมูลฟอร์มจากฐานข้อมูลตาม id
  }
}
