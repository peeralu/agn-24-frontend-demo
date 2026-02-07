import 'package:get/get.dart';

class WalletHistoryController extends GetxController {
  final RxList<Map<String, dynamic>> transactions = <Map<String, dynamic>>[
    {"date": DateTime(2025, 11, 8, 14, 30), "type": "เติมเงิน", "amount": 2000.0, "status": "สำเร็จ"},
    {"date": DateTime(2025, 11, 6, 9, 15), "type": "ชำระค่าประกัน", "amount": -650.0, "status": "สำเร็จ"},
    {"date": DateTime(2025, 11, 5, 20, 10), "type": "ถอนเงิน", "amount": -1000.0, "status": "สำเร็จ"},
    {"date": DateTime(2025, 11, 3, 17, 50), "type": "เติมเงิน", "amount": 3000.0, "status": "สำเร็จ"},
  ].obs;

  String? filterType;
  final List<String> types = ["ทั้งหมด", "เติมเงิน", "ถอนเงิน", "ชำระค่าประกัน"];

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
