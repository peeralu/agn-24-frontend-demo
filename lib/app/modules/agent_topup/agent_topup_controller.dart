import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AgentTopupController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final RxDouble balance = 18500.00.obs;

  final RxList<Map<String, dynamic>> history = <Map<String, dynamic>>[
    {"date": "8 พ.ย. 2025", "method": "โอนผ่านธนาคาร", "amount": 3000.0, "status": "สำเร็จ"},
    {"date": "5 พ.ย. 2025", "method": "QR PromptPay", "amount": 1500.0, "status": "สำเร็จ"},
    {"date": "2 พ.ย. 2025", "method": "บัตรเครดิต", "amount": 500.0, "status": "ไม่สำเร็จ"},
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
