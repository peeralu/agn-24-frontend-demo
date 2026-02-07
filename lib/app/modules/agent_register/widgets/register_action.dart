import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

class RegisterAction extends GetView<AgentRegisterController> {
  final bool isFisrtStep;
  final bool isLastStep;

  const RegisterAction({super.key, required this.isFisrtStep, required this.isLastStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.grey.withAlpha(20)),
      padding: EdgeInsets.symmetric(vertical: AppSize.md),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            text: "ย้อนกลับ",
            onPressed: controller.onPreviousStep,
            isLoading: controller.isLoading.value,
            isEnabled: !isFisrtStep,
            status: AppColors.warning,
            variant: AppButtonVariant.soft,
            size: AppButtonSize.md,
          ),
          AppSpace.horizontal.md,
          AppButton(
            text: "ถัดไป",
            onPressed: controller.onNextStep,
            isLoading: controller.isLoading.value,
            isEnabled: !isLastStep,
            status: AppColors.success,
            variant: AppButtonVariant.soft,
            size: AppButtonSize.md,
          ),
          AppSpace.horizontal.md,
        ],
      ),
    );
  }
}
