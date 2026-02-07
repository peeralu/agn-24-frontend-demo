import 'package:frontend/app/lib_view.dart' hide AppColors;
import 'package:frontend/app/modules/widgets/widgets.dart';

import '../admin_controller.dart';

class HeaderBar extends GetView<AdminController> {
  const HeaderBar({super.key, this.title, this.breadcrumb});

  final String? title;
  final Widget? breadcrumb;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        boxShadow: [BoxShadow(color: Colors.grey.withAlpha(51), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                AppSpace.horizontal.md,
                IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                Spacer(),
                AppSpace.horizontal.lg,
                Obx(() {
                  final user = controller.user.value;
                  final name = user != null ? user.fullName : 'ผู้ดูแลระบบ';
                  final role = user != null ? user.roleName : '-';
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(color: AppColor.primary.withAlpha(20)),
                    child: Column(children: [name.bodyMedium.bold, role.bodySmall.size(16)]),
                  );
                }),
                AppSpace.horizontal.md,
              ],
            ),
          ),
          breadcrumb ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
