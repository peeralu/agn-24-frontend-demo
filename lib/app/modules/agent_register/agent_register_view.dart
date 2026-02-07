import 'package:frontend/app/lib_view.dart';

import 'agent_register_controller.dart';
import 'widgets/breadcrumb.dart';
import 'widgets/content.dart';

class AgentRegisterView extends GetView<AgentRegisterController> {
  const AgentRegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(breadcrumb: BreadcrumbPage(), child: ContentView());
  }
}
