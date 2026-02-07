import 'package:jiffy/jiffy.dart';

import 'package:frontend/app/lib_view.dart';

import 'admin_insurance_controller.dart';

class AdminInsuranceView extends GetView<AdminInsuranceController> {
  const AdminInsuranceView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(child: ContentView());
  }
}

class ContentView extends GetView<AdminInsuranceController> {
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
              title: "จัดการรายชื่อบริษัทประกัน",
              columns: const ["ID", "ชื่อ", "โค้ด", "เวลาล่าสุด", "เปิด/ปิด"],
              columnFlex: [
                AdminTableWidth(fixed: 60),
                AdminTableWidth(flex: 1),
                AdminTableWidth(flex: 1),
                AdminTableWidth(fixed: 200),
                AdminTableWidth(fixed: 90),
              ],
              columnAlign: [
                AdminTableAlign.center,
                AdminTableAlign.left,
                AdminTableAlign.left,
                AdminTableAlign.center,
                AdminTableAlign.center,
              ],
              columnType: [int, String, String, Jiffy, bool],
              rows: controller.companies.map((e) => e.table).toList(),
              onAdd: controller.onAdd,
              onEdit: controller.onEdit,
              onDelete: controller.onDel,
              isLoading: controller.isLoading.value,
            ),
          ],
        ),
      );
    });
  }
}
