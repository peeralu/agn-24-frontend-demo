import 'package:frontend/app/lib_view.dart';

import 'admin_insurance_form_controller.dart';

class AdminInsuranceFormView extends GetView<AdminInsuranceFormController> {
  const AdminInsuranceFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(child: ContentView());
  }
}

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
