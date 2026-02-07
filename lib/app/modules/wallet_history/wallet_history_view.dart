import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'wallet_history_controller.dart';

class WalletHistoryView extends GetView<WalletHistoryController> {
  const WalletHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(
      child: Row(
        children: [
          Spacer(flex: 1),
          Expanded(flex: 10, child: ContentView()),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}

class ContentView extends GetView<WalletHistoryController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('d MMM yyyy • HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🧭 Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ประวัติธุรกรรม", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            Text(
              "อัปเดตล่าสุด: ${DateFormat('d MMM yyyy HH:mm').format(DateTime.now())}",
              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // 🔍 Filter
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            DropdownButton<String>(
              value: controller.filterType ?? "ทั้งหมด",
              items: controller.types.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => controller.filterType = v,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'ค้นหารายการ...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  // ใช้สำหรับ search เพิ่มได้ในอนาคต
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // 📜 Transaction List
        Expanded(
          child: Obx(() {
            final filtered = controller.transactions.where((t) {
              if (controller.filterType == null || controller.filterType == "ทั้งหมด") return true;
              return t["type"] == controller.filterType;
            }).toList();

            if (filtered.isEmpty) {
              return const Center(
                child: Text("ไม่พบประวัติธุรกรรม", style: TextStyle(color: AppColors.textSecondary)),
              );
            }

            return ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = filtered[index];
                final isPositive = item["amount"] > 0;
                final color = isPositive ? Colors.green : Colors.redAccent;
                final icon = item["type"] == "เติมเงิน"
                    ? Icons.add_circle_outline
                    : item["type"] == "ถอนเงิน"
                    ? Icons.arrow_downward_outlined
                    : Icons.receipt_long_outlined;

                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: Icon(icon, color: color, size: 24),
                  ),
                  title: Text(item["type"], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  subtitle: Text(
                    dateFormat.format(item["date"]),
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${isPositive ? '+' : '-'}฿ ${item["amount"].abs().toStringAsFixed(2)}",
                        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item["status"],
                        style: TextStyle(
                          color: item["status"] == "สำเร็จ" ? Colors.green : Colors.orange,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
