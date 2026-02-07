import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'agent_customers_controller.dart';

class AgentCustomersView extends GetView<AgentCustomersController> {
  const AgentCustomersView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "จัดการลูกค้า (Agent Customers)", child: ContentView());
  }
}

class ContentView extends GetView<AgentCustomersController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Header
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Get.snackbar("เพิ่มลูกค้า", "เปิดฟอร์มเพิ่มลูกค้าใหม่", snackPosition: SnackPosition.BOTTOM);
              },
              icon: const Icon(Icons.add),
              label: const Text("เพิ่มลูกค้าใหม่"),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // 🔍 Search + Filter
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'ค้นหาชื่อลูกค้า...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                value: controller.statusFilter.value.isEmpty ? null : controller.statusFilter.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  prefixIcon: const Icon(Icons.filter_alt_outlined),
                  hintText: "กรองสถานะ",
                ),
                items: const [
                  DropdownMenuItem(value: 'active', child: Text('ใช้งานอยู่')),
                  DropdownMenuItem(value: 'inactive', child: Text('ปิดการใช้งาน')),
                ],
                onChanged: (val) => controller.statusFilter.value = val ?? '',
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // 🧾 Customers Table
        Expanded(
          child: Obx(() {
            final filtered = controller.customers
                .where(
                  (c) =>
                      c['name'].toString().toLowerCase().contains(controller.searchQuery.value.toLowerCase()) &&
                      (controller.statusFilter.value.isEmpty || c['status'] == controller.statusFilter.value),
                )
                .toList();

            if (filtered.isEmpty) {
              return const Center(child: Text("ไม่พบข้อมูลลูกค้า"));
            }

            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(AppColors.surface),
                columnSpacing: 16,
                horizontalMargin: 16,
                columns: const [
                  DataColumn(label: Text("รหัสลูกค้า")),
                  DataColumn(label: Text("ชื่อลูกค้า")),
                  DataColumn(label: Text("เบอร์โทรศัพท์")),
                  DataColumn(label: Text("สถานะ")),
                  DataColumn(label: Text("วันที่สมัคร")),
                  DataColumn(label: Text("จัดการ")),
                ],
                rows: filtered.map((c) {
                  final isActive = c['status'] == 'active';
                  return DataRow(
                    cells: [
                      DataCell(Text(c['id'])),
                      DataCell(Text(c['name'])),
                      DataCell(Text(c['phone'])),
                      DataCell(
                        Chip(
                          label: Text(isActive ? "ใช้งานอยู่" : "ปิดการใช้งาน"),
                          backgroundColor: isActive ? Colors.green.shade50 : Colors.grey.shade200,
                          labelStyle: TextStyle(
                            color: isActive ? Colors.green.shade800 : Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                        ),
                      ),
                      DataCell(Text(c['joined'])),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility_outlined, size: 20, color: Colors.blueGrey),
                              onPressed: () {
                                Get.toNamed("/agent/customers/${c['id']}");
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.orangeAccent),
                              onPressed: () {
                                Get.snackbar(
                                  "แก้ไขข้อมูล",
                                  "เปิดฟอร์มแก้ไขลูกค้า ${c['name']}",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          }),
        ),
      ],
    );
  }
}
