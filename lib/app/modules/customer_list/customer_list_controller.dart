import 'package:get/get.dart';

import 'package:frontend/app/lib_controller.dart';

class CustomerListController extends GetxController {
  final isLoading = false.obs;

  final customers = <Customer>[].obs;
  @override
  void onInit() {
    fetchCustomers();
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

extension CustomerListControllerAction on CustomerListController {
  Future<void> fetchCustomers() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    customers.value = [
      Customer(id: 1, name: "นายเอ", phone: "0812345678", carCount: 3, isActive: true),
      Customer(id: 2, name: "นายบี", phone: "0898765432", carCount: 5, isActive: false),
      Customer(id: 3, name: "นายซี", phone: "0865432198", carCount: 2, isActive: true),
    ];
    isLoading.value = false;
  }

  Future<void> onAdd() async {
    await Get.toNamed(Routes.CUSTOMER_PROFILE, arguments: 0);
  }

  Future<void> onView(int index) async {
    final customer = customers[index];
    await Get.toNamed(Routes.CUSTOMER_PROFILE, arguments: customer.id);
  }
}

class Customer {
  final int id;
  final String name;
  final String phone;
  final int carCount;
  final bool isActive;

  Customer({required this.id, required this.name, required this.phone, required this.carCount, required this.isActive});

  List<dynamic> get table => [id, name, phone, carCount, isActive, null];
}
