import 'package:frontend/app/lib_controller.dart';

class AgentRegisterController extends GetxController {
  final isLoading = false.obs;
  final formKey = List<GlobalKey<FormBuilderState>>.generate(12, (index) => GlobalKey<FormBuilderState>());
  final formAuthKey = GlobalKey<FormBuilderState>();
  final formPersonalInfoKey = GlobalKey<FormBuilderState>();
  final formHomeAddressKey = GlobalKey<FormBuilderState>();
  final formCurrentAddressKey = GlobalKey<FormBuilderState>();
  final formContactKey = GlobalKey<FormBuilderState>();
  final pageController = PageController(initialPage: 0);
  final activeStep = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

extension AgentRegisterControllerAction on AgentRegisterController {
  void onChangeStep(int step) {
    activeStep.value = step;
    pageController.animateToPage(step, duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  void onNextStep() {
    try {
      onValidate();
      onChangeStep(activeStep.value + 1);
    } catch (e) {
      print(e);
    }
  }

  void onPreviousStep() {
    onChangeStep(activeStep.value - 1);
  }

  GlobalKey<FormBuilderState> getFormKey() {
    return formKey[activeStep.value];
  }

  void onValidate() {
    switch (activeStep.value) {
      case 0:
        {
          if (formAuthKey.currentState?.saveAndValidate() ?? false) {
            print(formAuthKey.currentState?.value);
          } else {
            final errors = formAuthKey.currentState!.errors;
            throw Exception(errors);
          }
        }
        break;
      case 1:
        {
          if (formPersonalInfoKey.currentState?.saveAndValidate() ?? false) {
            print(formPersonalInfoKey.currentState?.value);
            onNextStep();
          } else {
            print("validation failed");
          }
        }
        break;
      default:
        {
          onNextStep();
        }
    }
  }
}
