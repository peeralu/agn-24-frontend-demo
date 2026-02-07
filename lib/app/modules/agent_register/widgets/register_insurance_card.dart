import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterInsuranceCardWidget extends GetView<AgentRegisterController> {
  const RegisterInsuranceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ที่อยู่ปัจจุบัน',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'นายหน้า',
            isHorizontal: true,
            required: true,
            field: AdminFormDropdown(
              name: 'current_house_number',
              label: "กรุณาเลือกนายหน้า",
              enabled: !controller.isLoading.value,
              items: [
                DropdownMenuItem(value: 'เป็นนายหน้า', child: Text('เป็นนายหน้า')),
                DropdownMenuItem(value: 'ไม่เป็นนายหน้า', child: Text('ไม่เป็นนายหน้า')),
              ],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาเลือกนายหน้า"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'คำนำหน้า',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'insurance_prefix',
              label: "กรุณาใส่คำนำหน้า",
              enabled: !controller.isLoading.value,
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
            label: 'หมายเลขบัตร',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'insurance_id_number',
              label: "กรุณาใส่หมายเลขบัตร",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่หมายเลขบัตร"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
