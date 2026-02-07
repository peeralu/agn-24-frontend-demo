import 'package:frontend/app/lib_view.dart';

import '../admin_users_form_controller.dart';

class BreadcrumbPage extends GetView<AdminUsersFormController> {
  const BreadcrumbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
      title: 'ฟอร์มจัดการผู้ใช้งานระบบ',
      items: [
        BreadcrumbItem(label: 'ผู้ใช้งานระบบ', onTap: controller.onUserPage),
        BreadcrumbItem(label: 'ฟอร์ม'),
      ],
    );
  }
}
