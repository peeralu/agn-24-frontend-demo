import 'package:frontend/app/lib_view.dart';

import '../admin_users_controller.dart';

class ContentView extends GetView<AdminUsersController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: AdminDataTable(
          title: "ผู้ใช้งานระบบ",
          columns: const ["ID", "ชื่อ", "บทบาท", "เวลาล่าสุด", "เปิด/ปิด"],
          columnFlex: [
            AdminTableWidth(fixed: 50),
            AdminTableWidth(flex: 1),
            AdminTableWidth(flex: 1),
            AdminTableWidth(fixed: 240),
            AdminTableWidth(fixed: 100),
          ],
          columnAlign: [
            AdminTableAlign.center,
            AdminTableAlign.left,
            AdminTableAlign.left,
            AdminTableAlign.center,
            AdminTableAlign.center,
          ],
          columnType: [int, String, String, String, bool],
          rows: controller.users.map((e) => e.table).toList(),
          onAdd: controller.onAdd,
          onEdit: (int index) {
            return Future.value();
          },
          onDelete: (int index) {
            return Future.value();
          },
          isLoading: controller.isLoading.value,
        ),
      );
    });
  }
}
