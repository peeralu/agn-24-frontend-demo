import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'customer_models_controller.dart';

class CustomerModelsView extends GetView<CustomerModelsController> {
  const CustomerModelsView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ประวัติการซื้อประกัน", child: ContentView());
  }
}

class ContentView extends GetView<CustomerModelsController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔍 Search Box
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'ค้นหาโมเดล...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (v) {
            controller.searchQuery.value = v;
          },
        ),

        const SizedBox(height: 16),

        // 🏷 Filter Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("รายการโมเดลทั้งหมด", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: 'ล่าสุด',
              items: const [
                DropdownMenuItem(value: 'ล่าสุด', child: Text('เรียงจากล่าสุด')),
                DropdownMenuItem(value: 'เก่าสุด', child: Text('เรียงจากเก่าสุด')),
              ],
              onChanged: (_) {},
            ),
          ],
        ),

        const SizedBox(height: 16),

        // 📦 Model Grid
        Expanded(
          child: Obx(() {
            final filtered = controller.filteredModels
                .where((m) => m['name'].toString().toLowerCase().contains(controller.searchQuery.toLowerCase()))
                .toList();

            if (filtered.isEmpty) {
              return const Center(child: Text("ไม่พบโมเดลที่ตรงกับคำค้นหา"));
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 1000
                    ? 3
                    : constraints.maxWidth > 600
                    ? 2
                    : 1;

                return GridView.builder(
                  padding: const EdgeInsets.only(top: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.6,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final model = filtered[index];
                    return _buildModelCard(model, context);
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }

  /// 🧱 Card แสดงโมเดลแต่ละรายการ
  Widget _buildModelCard(Map<String, dynamic> model, BuildContext context) {
    final theme = Theme.of(context);
    final isActive = model['status'] == 'active';

    return Card(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isActive ? Colors.green.shade300 : AppColors.border, width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📸 รูปภาพโมเดล
            Expanded(
              child: Center(child: Image.asset(model['image'], fit: BoxFit.contain, height: 100)),
            ),

            const SizedBox(height: 12),

            // 🏷 ชื่อโมเดล
            Text(model['name'], style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(model['type'], style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600)),
            const SizedBox(height: 6),

            // 🕓 วันที่สร้าง
            Text(
              "สร้างเมื่อ: ${model['created_at']}",
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
            ),
            const Spacer(),

            // 🟢 สถานะ + ปุ่ม
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(isActive ? "ใช้งานอยู่" : "ปิดการใช้งาน"),
                  backgroundColor: isActive ? Colors.green.shade50 : Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: isActive ? Colors.green : Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                ),
                TextButton.icon(
                  onPressed: () {
                    Get.toNamed('/customer/models/${model['id']}');
                  },
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  label: const Text("ดูรายละเอียด"),
                  style: TextButton.styleFrom(foregroundColor: AppColors.textPrimary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
