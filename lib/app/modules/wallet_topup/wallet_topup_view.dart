import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'wallet_topup_controller.dart';

class WalletTopupView extends GetView<WalletTopupController> {
  const WalletTopupView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ยอดเงินในกระเป๋า (Wallet Topup)", child: ContentView());
  }
}

class ContentView extends GetView<WalletTopupController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🪙 Wallet Card
          Obx(() {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF007BFF), Color(0xFF00B4D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.6],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 3)),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ยอดคงเหลือปัจจุบัน", style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(
                    "฿ ${controller.balance.value.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _walletAction(Icons.add_circle_outline, "เติมเงิน", Colors.white, () {
                        Get.toNamed("/wallet/topup");
                      }),
                      const SizedBox(width: 16),
                      _walletAction(Icons.arrow_downward_outlined, "ถอนเงิน", Colors.white, () {
                        Get.snackbar("ถอนเงิน", "เปิดหน้าถอนเงิน", snackPosition: SnackPosition.BOTTOM);
                      }),
                      const SizedBox(width: 16),
                      _walletAction(Icons.swap_horiz_outlined, "โอนให้ผู้อื่น", Colors.white, () {
                        Get.snackbar("โอนเงิน", "เปิดหน้าการโอน", snackPosition: SnackPosition.BOTTOM);
                      }),
                    ],
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 32),

          // 📊 Wallet Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statCard("รายรับเดือนนี้", "฿ 7,200", Icons.trending_up_outlined, Colors.green),
              _statCard("รายจ่ายเดือนนี้", "฿ 3,500", Icons.trending_down_outlined, Colors.redAccent),
              _statCard("ธุรกรรมทั้งหมด", "24 รายการ", Icons.receipt_long_outlined, Colors.blueAccent),
            ],
          ),
          const SizedBox(height: 32),

          // 📜 Transaction History
          Text("ประวัติธุรกรรมล่าสุด", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Obx(() {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: controller.transactions.map((t) {
                  final isPositive = t["amount"] > 0;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColors.border, width: 0.6)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                          color: isPositive ? Colors.green : Colors.redAccent,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t["type"], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                              const SizedBox(height: 2),
                              Text(t["date"], style: const TextStyle(fontSize: 12, color: Colors.black54)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${isPositive ? '+' : '-'}฿ ${t["amount"].abs().toStringAsFixed(2)}",
                              style: TextStyle(
                                color: isPositive ? Colors.green.shade700 : Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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

  Widget _walletAction(IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
