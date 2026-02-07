import 'package:frontend/app/lib_view.dart';

import 'main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover, opacity: 0.3),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(32),
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image(image: AssetImage('assets/images/logo.png'), fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
