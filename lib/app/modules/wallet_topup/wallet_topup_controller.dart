import 'package:get/get.dart';

class WalletTopupController extends GetxController {
  final RxDouble balance = 18500.75.obs;
  final RxList<Map<String, dynamic>> transactions = <Map<String, dynamic>>[
    {"date": "8 พ.ย. 2025", "type": "เติมเงิน", "amount": 2000.0, "status": "สำเร็จ"},
    {"date": "6 พ.ย. 2025", "type": "ชำระค่าประกัน", "amount": -650.0, "status": "สำเร็จ"},
    {"date": "5 พ.ย. 2025", "type": "ถอนเงิน", "amount": -1000.0, "status": "สำเร็จ"},
    {"date": "3 พ.ย. 2025", "type": "เติมเงิน", "amount": 3000.0, "status": "สำเร็จ"},
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
