import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'agent_insurance_search_controller.dart';

class AgentInsuranceSearchView extends GetView<AgentInsuranceSearchController> {
  const AgentInsuranceSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ค้นหาแผนประกัน (Agent Insurance Search)", child: ContentView());
  }
}

class ContentView extends GetView<AgentInsuranceSearchController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🧭 Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ค้นหาแผนประกัน", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {
                  controller.searchQuery.value = '';
                  controller.statusFilter.value = '';
                },
                icon: const Icon(Icons.refresh),
                label: const Text("ล้างตัวกรอง"),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 🔍 Search & Filter
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'ค้นหาชื่อแผนประกัน...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (v) {
                    controller.searchQuery.value = v;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category_outlined),
                    hintText: 'ประเภทประกัน',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'insurance_health', child: Text('ประกันสุขภาพ')),
                    DropdownMenuItem(value: 'insurance_accident', child: Text('ประกันอุบัติเหตุ')),
                    DropdownMenuItem(value: 'insurance_car', child: Text('ประกันรถยนต์')),
                  ],
                  onChanged: (val) {
                    controller.statusFilter.value = val ?? '';
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 📦 Insurance Result Grid
          Obx(() {
            final filtered = controller.insurances
                .where(
                  (i) =>
                      i['name'].toString().toLowerCase().contains(controller.searchQuery.toLowerCase()) &&
                      (controller.statusFilter.value == '' || i['type'] == controller.statusFilter.value),
                )
                .toList();

            if (filtered.isEmpty) {
              return const Center(
                child: Padding(padding: EdgeInsets.only(top: 40), child: Text("ไม่พบแผนประกันที่ตรงกับการค้นหา")),
              );
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 1000
                    ? 3
                    : constraints.maxWidth > 600
                    ? 2
                    : 1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return _buildInsuranceCard(item, context);
                  },
                );
              },
            );
          }),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  // 🧱 Card Design
  Widget _buildInsuranceCard(Map<String, dynamic> item, BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // รูปประกัน
            Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(item['image'], fit: BoxFit.cover, width: 100, height: 100),
              ),
            ),
            const SizedBox(height: 12),

            // ชื่อและบริษัท
            Text(item['name'], style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(item['company'], style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600)),
            const SizedBox(height: 6),

            // ประเภท + ความคุ้มครอง
            Text(item['type'], style: theme.textTheme.bodyMedium),
            Text(item['coverage'], style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade700)),

            const Spacer(),

            // ราคา + ปุ่ม
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "฿ ${item['price'].toStringAsFixed(0)} / ปี",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed("/agent/insurance/${item['id']}");
                  },
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  label: const Text("ดูรายละเอียด"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
