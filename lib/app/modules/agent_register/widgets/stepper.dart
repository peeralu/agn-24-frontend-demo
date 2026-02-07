import 'package:easy_stepper/easy_stepper.dart';

import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

class StepperWidget extends GetView<AgentRegisterController> {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return EasyStepper(
        activeStep: controller.activeStep.value,
        lineStyle: const LineStyle(lineLength: 80, lineThickness: 1, lineSpace: 5),
        stepRadius: 30,
        direction: Axis.horizontal,
        fitWidth: false,
        textDirection: TextDirection.rtl,
        finishedStepTextColor: AppColors.success.color,
        finishedStepIconColor: AppColors.success.color,
        finishedStepBorderColor: AppColors.success.color,
        finishedStepBackgroundColor: AppColors.success.soft,
        activeStepTextColor: AppColors.info.color,
        activeStepIconColor: AppColors.info.color,
        activeStepBorderColor: AppColors.info.color,
        activeStepBackgroundColor: AppColors.info.soft,
        unreachedStepIconColor: AppColors.grey.color,
        unreachedStepBorderColor: AppColors.grey.color,
        unreachedStepTextColor: AppColors.grey.color,
        showLoadingAnimation: false,
        steps: const [
          EasyStep(icon: Icon(Icons.person), title: 'รหัสผู้ใช้งาน'),
          EasyStep(icon: Icon(Icons.person), title: 'ข้อมูลส่วนตัว'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.addressBook), title: 'ที่อยู่ตามบัตร ปชช.'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.addressCard), title: 'ที่อยู่จัดส่งเอกสาร'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.handHoldingHand), title: 'สถานภาพ'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.idCard), title: 'มีบัตรนายหน้า'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.userDoctor), title: 'อาชีพ'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.calculator), title: 'บัญชี'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.moneyBill), title: 'ผู้รับผลประโยชน์'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.fileLines), title: 'เอกสาร'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.personChalkboard), title: 'ผู้แนะนำ'),
          EasyStep(icon: FaIcon(FontAwesomeIcons.hourglassHalf), title: 'รอผลการอนุมัติ'),
        ],
        onStepReached: controller.onChangeStep,
      );
    });
  }
}
