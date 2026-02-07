import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'agent_topup_controller.dart';

class AgentTopupView extends GetView<AgentTopupController> {
  const AgentTopupView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "เติมเงินเข้ากระเป๋า (Agent Topup)", child: ContentView());
  }
}

class ContentView extends GetView<AgentTopupController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 💰 Wallet Balance
          Obx(() {
            return Container(
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Row(
                children: [
                  const Icon(Icons.account_balance_wallet_outlined, color: Colors.green, size: 36),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("ยอดเงินคงเหลือ", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        Text(
                          "฿ ${controller.balance.value.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.formKey.currentState?.reset();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("รีเซ็ตฟอร์ม"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 32),

          // 💳 Topup Form
          Card(
            color: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: FormBuilder(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "กรอกข้อมูลการเติมเงิน",
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    FormBuilderTextField(
                      name: "amount",
                      decoration: const InputDecoration(
                        labelText: "จำนวนเงิน (บาท)",
                        prefixIcon: Icon(Icons.payments_outlined),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "กรุณากรอกจำนวนเงิน"),
                        FormBuilderValidators.numeric(errorText: "กรุณากรอกเป็นตัวเลข"),
                        FormBuilderValidators.min(100, errorText: "ขั้นต่ำ 100 บาท"),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderDropdown(
                      name: "method",
                      decoration: const InputDecoration(
                        labelText: "ช่องทางการชำระเงิน",
                        prefixIcon: Icon(Icons.credit_card_outlined),
                      ),
                      items: const [
                        DropdownMenuItem(value: "bank", child: Text("โอนผ่านธนาคาร")),
                        DropdownMenuItem(value: "qr", child: Text("QR PromptPay")),
                        DropdownMenuItem(value: "credit", child: Text("บัตรเครดิต / เดบิต")),
                      ],
                      validator: FormBuilderValidators.required(errorText: "กรุณาเลือกช่องทาง"),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (controller.formKey.currentState?.saveAndValidate() ?? false) {
                            final data = controller.formKey.currentState!.value;
                            final double amount = double.tryParse(data["amount"].toString()) ?? 0;
                            controller.balance.value += amount;

                            controller.history.insert(0, {
                              "date": "วันนี้",
                              "method": _methodName(data["method"]),
                              "amount": amount,
                              "status": "สำเร็จ",
                            });

                            Get.snackbar(
                              "เติมเงินสำเร็จ",
                              "ยอดเงินเพิ่มขึ้น ${amount.toStringAsFixed(2)} บาท",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green.shade100,
                              colorText: Colors.green.shade900,
                            );
                          }
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text("ยืนยันการเติมเงิน"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // 📜 History Section
          Text("ประวัติการเติมเงินล่าสุด", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          Obx(() {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: controller.history.map((h) {
                  final isSuccess = h["status"] == "สำเร็จ";
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColors.border, width: 0.6)),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(h["date"], style: const TextStyle(fontSize: 14))),
                        Expanded(flex: 3, child: Text(h["method"], style: const TextStyle(fontSize: 14))),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "฿ ${h["amount"].toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Chip(
                              label: Text(h["status"]),
                              backgroundColor: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
                              labelStyle: TextStyle(
                                color: isSuccess ? Colors.green.shade800 : Colors.red.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                              side: BorderSide(color: isSuccess ? Colors.green.shade200 : Colors.red.shade200),
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }),

          const SizedBox(height: 48),
        ],
      ),
    );
  }

  String _methodName(String? key) {
    switch (key) {
      case "bank":
        return "โอนผ่านธนาคาร";
      case "qr":
        return "QR PromptPay";
      case "credit":
        return "บัตรเครดิต / เดบิต";
      default:
        return "-";
    }
  }
}
