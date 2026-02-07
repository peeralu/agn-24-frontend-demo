import 'package:get/get.dart';

import 'package:frontend/app/data/models/models.dart';
import 'package:frontend/app/routes/app_pages.dart';

class AdminInsuranceController extends GetxController {
  final companies = <Company>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchCompanies();
    super.onInit();
  }
}

extension AdminInsuranceControllerAction on AdminInsuranceController {
  Future<void> fetchCompanies() async {}

  Future<void> onAdd() async {
    Get.toNamed(Routes.ADMIN_INSURANCE_FORM, arguments: null, parameters: {'id': '0'});
  }

  Future<void> onEdit(int index) async {
    Get.toNamed(
      Routes.ADMIN_INSURANCE_FORM,
      arguments: companies[index],
      parameters: {'id': companies[index].id.toString()},
    );
  }

  Future<void> onDel(int index) async {
    final id = companies[index].id;
    if (id != null) {}
  }
}
