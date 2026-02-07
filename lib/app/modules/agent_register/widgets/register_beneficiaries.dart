import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterBeneficiariesWidget extends GetView<AgentRegisterController> {
  const RegisterBeneficiariesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ผู้รับผลประโยชน์',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'คำนำหน้า',
            isHorizontal: true,
            required: true,
            field: AdminFormDropdown(
              name: 'prefix',
              label: "กรุณาใส่คำนำหน้า",
              enabled: !controller.isLoading.value,
              items: [
                DropdownMenuItem(value: 'นาย', child: Text('นาย')),
                DropdownMenuItem(value: 'นางสาว', child: Text('นางสาว')),
                DropdownMenuItem(value: 'นาง', child: Text('นาง')),
              ],
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่คำนำหน้า")]),
            ),
          ),
          AdminFormField(
            label: 'ชื่อ',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'insurance_name',
              label: "กรุณาใส่ชื่อ",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่ชื่อ")]),
            ),
          ),
          AdminFormField(
            label: 'นามสกุล',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'insurance_last_name',
              label: "กรุณาใส่นามสกุล",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่นามสกุล")]),
            ),
          ),
          AdminFormField(
            label: 'เบอร์โทรศัพท์',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'insurance_phone',
              label: "กรุณาใส่เบอร์โทรศัพท์",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่เบอร์โทรศัพท์"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'อีเมล',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'insurance_email',
              label: "กรุณาใส่อีเมล",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่อีเมล")]),
            ),
          ),
        ],
      ),
    );
  }
}
