import 'package:get/get.dart';

class CustomerModelsController extends GetxController {
  final RxList<Map<String, dynamic>> models = <Map<String, dynamic>>[
    {
      'id': 'MDL-001',
      'name': 'แผนประกันสุขภาพ Gold',
      'type': 'ประกันสุขภาพ',
      'status': 'active',
      'image': 'assets/images/avatar.png',
      'created_at': '2024-05-10',
    },
    {
      'id': 'MDL-002',
      'name': 'ประกันอุบัติเหตุ Silver',
      'type': 'ประกันอุบัติเหตุ',
      'status': 'inactive',
      'image': 'assets/images/avatar.png',
      'created_at': '2024-03-21',
    },
    {
      'id': 'MDL-003',
      'name': 'ประกันรถยนต์ Premium',
      'type': 'ประกันรถยนต์',
      'status': 'active',
      'image': 'assets/images/avatar.png',
      'created_at': '2024-06-02',
    },
  ].obs;

  final searchQuery = ''.obs;
  List<Map<String, dynamic>> get filteredModels {
    if (searchQuery.isEmpty) {
      return models;
    } else {
      return models
          .where(
            (model) =>
                model['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
                model['type'].toLowerCase().contains(searchQuery.toLowerCase()) ||
                model['id'].toLowerCase().contains(searchQuery.toLowerCase()),
          )
          .toList();
    }
  }

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
