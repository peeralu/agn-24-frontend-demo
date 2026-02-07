import 'package:get/get.dart';

class AgentCustomersController extends GetxController {
  final RxList<Map<String, dynamic>> customers = <Map<String, dynamic>>[
    {'id': 'CUST-001', 'name': 'สมชาย ใจดี', 'phone': '089-123-4567', 'status': 'active', 'joined': '10 ก.ค. 2024'},
    {'id': 'CUST-002', 'name': 'นิตยา รักสงบ', 'phone': '081-555-9999', 'status': 'inactive', 'joined': '2 พ.ค. 2024'},
    {'id': 'CUST-003', 'name': 'อารีย์ มั่งมี', 'phone': '082-888-7777', 'status': 'active', 'joined': '15 ส.ค. 2024'},
  ].obs;

  final searchQuery = ''.obs;
  final statusFilter = ''.obs;

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
