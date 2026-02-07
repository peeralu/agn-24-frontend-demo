import 'package:frontend/app/lib_view.dart';

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
      title: 'รายละเอียดลูกค้า',
      items: [
        BreadcrumbItem(label: 'รายชื่อลูกค้า', onTap: () => Get.back()),
        BreadcrumbItem(label: 'รายละเอียดลูกค้า'),
      ],
    );
  }
}
