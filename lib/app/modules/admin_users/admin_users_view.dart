import 'package:frontend/app/lib_view.dart';

import 'admin_users_controller.dart';
import 'widgets/breadcrumb.dart';
import 'widgets/content.dart';

class AdminUsersView extends GetView<AdminUsersController> {
  const AdminUsersView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(breadcrumb: BreadcrumbPage(), child: ContentView());
  }
}
