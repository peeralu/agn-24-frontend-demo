import 'package:get/get.dart';

class InsuranceSearchController extends GetxController {
  final searchQuery = ''.obs;
  final typeFilter = ''.obs;
  final coverageDuration = ''.obs;

  final RxList<Map<String, dynamic>> plans = <Map<String, dynamic>>[
    {
      'id': 'PL-001',
      'name': 'แผนประกันเดินทาง Bronze',
      'type': 'ประกันเดินทาง',
      'company': 'MSIG',
      'price': 490,
      'duration': '5 วัน',
      'coverage': 'คุ้มครองสูงสุด 1,000,000 บาท',
      'image': 'assets/images/plan_travel2.jpg',
    },
    {
      'id': 'PL-002',
      'name': 'แผนประกันเดินทาง Silver',
      'type': 'ประกันเดินทาง',
      'company': 'Sompo',
      'price': 890,
      'duration': '10 วัน',
      'coverage': 'คุ้มครองสูงสุด 2,000,000 บาท',
      'image': 'assets/images/plan_travel2.jpg',
    },
    {
      'id': 'PL-003',
      'name': 'แผนประกันรถยนต์ Standard',
      'type': 'ประกันรถยนต์',
      'company': 'AXA',
      'price': 15000,
      'duration': '1 ปี',
      'coverage': 'คุ้มครองสูงสุด 500,000 บาท',
      'image': 'assets/images/plan_travel2.jpg',
    },
    {
      'id': 'PL-004',
      'name': 'แผนประกันรถยนต์ Premium',
      'type': 'ประกันรถยนต์',
      'company': 'Dhipaya',
      'price': 25000,
      'duration': '1 ปี',
      'coverage': 'คุ้มครองสูงสุด 1,000,000 บาท',
      'image': 'assets/images/plan_travel2.jpg',
    },
  ].obs;

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
