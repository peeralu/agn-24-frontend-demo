import 'package:frontend/app/lib_view.dart';

import 'admin_users_form_controller.dart';
import 'widgets/breadcrumb.dart';
import 'widgets/content.dart';

class AdminUsersFormView extends GetView<AdminUsersFormController> {
  const AdminUsersFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(breadcrumb: BreadcrumbPage(), child: ContentView());
  }
}
