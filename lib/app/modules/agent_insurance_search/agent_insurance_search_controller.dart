import 'package:get/get.dart';

class AgentInsuranceSearchController extends GetxController {
  final RxList<Map<String, dynamic>> insurances = <Map<String, dynamic>>[
    {
      'id': 'INS-001',
      'name': 'แผนประกันสุขภาพ Gold Care',
      'type': 'insurance_health',
      'price': 12000,
      'coverage': 'สูงสุด 1,000,000 บาท',
      'company': 'สุขใจประกันชีวิต',
      'image': 'assets/images/insurance_health.jpg',
    },
    {
      'id': 'INS-002',
      'name': 'แผนประกันอุบัติเหตุ Safe Plus',
      'type': 'insurance_accident',
      'price': 6900,
      'coverage': 'สูงสุด 500,000 บาท',
      'company': 'มั่นใจประกันภัย',
      'image': 'assets/images/insurance_health.jpg',
    },
    {
      'id': 'INS-003',
      'name': 'ประกันรถยนต์ Super Drive',
      'type': 'insurance_car',
      'price': 15800,
      'coverage': 'ซ่อมคู่กรณี / คุ้มครอง 1.5 ล้าน',
      'company': 'ไทยประกันภัย',
      'image': 'assets/images/insurance_health.jpg',
    },
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
