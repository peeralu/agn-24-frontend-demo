import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/app/modules/widgets/widgets.dart';
import 'package:frontend/app/routes/app_pages.dart';

import 'customer_list_controller.dart';

class CustomerListView extends GetView<CustomerListController> {
  const CustomerListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ประวัติการซื้อประกัน", child: ContentView());
  }
}

class ContentView extends GetView<CustomerListController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdminDataTable(
              title: "จัดการลูกค้า",
              columns: const ["ID", "ชื่อ", "เบอร์โทรศัพท์", "จำนวนรถ", "สถานะ", "รายละเอียด"],
              columnFlex: [
                AdminTableWidth(fixed: 60),
                AdminTableWidth(flex: 1),
                AdminTableWidth(flex: 1),
                AdminTableWidth(fixed: 200),
                AdminTableWidth(fixed: 90),
                AdminTableWidth(fixed: 120),
              ],
              columnAlign: [
                AdminTableAlign.center,
                AdminTableAlign.left,
                AdminTableAlign.left,
                AdminTableAlign.center,
                AdminTableAlign.center,
                AdminTableAlign.center,
              ],
              columnType: [int, String, String, int, bool, String],
              rows: controller.customers.map((e) => e.table).toList(),
              onAdd: controller.onAdd,
              onEdit: controller.onEdit,
              onDelete: controller.onDel,
              isLoading: controller.isLoading.value,
              isAdmin: false,
              cellBuilder: (value, col, row) {
                if (col == 5) {
                  return Center(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search_outlined, color: Colors.white, size: 14),
                        onPressed: () => controller.onEdit(row),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ],
        ),
      );
    });
  }
}
