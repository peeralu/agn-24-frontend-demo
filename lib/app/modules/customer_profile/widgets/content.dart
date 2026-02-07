import 'package:frontend/app/lib_controller.dart';
import 'package:frontend/app/lib_view.dart';

import '../customer_profile_controller.dart';

import 'model.dart';
import 'profile.dart';

class ContentView extends GetView<CustomerProfileController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSize.md,
      children: [
        Expanded(flex: 2, child: ProfileWidget()),
        Expanded(flex: 7, child: ModelWidget()),
      ],
    );
  }
}
