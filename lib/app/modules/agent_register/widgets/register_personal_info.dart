import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterPersonalInfoWidget extends GetView<AgentRegisterController> {
  const RegisterPersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ข้อมูลส่วนตัว',
        formKey: controller.formPersonalInfoKey,
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
              name: 'first_name',
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
              name: 'last_name',
              label: "กรุณาใส่นามสกุล",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่นามสกุล")]),
            ),
          ),
          AdminFormField(
            label: 'บัตรประชาชน',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'id_card',
              label: "กรุณาใส่บัตรประชาชน",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่บัตรประชาชน"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'วันเกิด',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'birth_date',
              label: "กรุณาใส่วันเกิด",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่วันเกิด")]),
            ),
          ),
          AdminFormField(
            label: 'สัญชาติ',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'nationality',
              label: "กรุณาใส่สัญชาติ",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่สัญชาติ")]),
            ),
          ),
          AdminFormField(
            label: 'เชื้อชาติ',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'ethnicity',
              label: "กรุณาใส่เชื้อชาติ",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่เชื้อชาติ"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'ศาสนา',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'religion',
              label: "กรุณาใส่ศาสนา",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่ศาสนา")]),
            ),
          ),
        ],
      ),
    );
  }
}
