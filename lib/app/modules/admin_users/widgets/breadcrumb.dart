import 'package:frontend/app/lib_view.dart';

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
      title: 'ฟอร์มจัดการผู้ใช้งานระบบ',
      items: [BreadcrumbItem(label: 'ผู้ใช้งานระบบ')],
    );
  }
}
