import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

class BreadcrumbPage extends GetView<AgentRegisterController> {
  const BreadcrumbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
      title: 'สมัครตัวแทน',
      items: [BreadcrumbItem(label: 'สมัครตัวแทน')],
    );
  }
}
