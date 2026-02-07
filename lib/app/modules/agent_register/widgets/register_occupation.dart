import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterOccupationWidget extends GetView<AgentRegisterController> {
  const RegisterOccupationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ข้อมูลอาชีพ',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: true, isLastStep: false),
        children: [
          AdminFormField(
            label: 'ประเภทอาชีพ',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'username',
              label: "กรุณาใส่ชื่อผู้ใช้งาน",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่ชื่อผู้ใช้งาน"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'อื่นๆ',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'other',
              label: "กรุณาใส่อื่นๆ",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่อื่นๆ")]),
            ),
          ),
        ],
      ),
    );
  }
}
