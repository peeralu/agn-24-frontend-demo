import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterStatusWidget extends GetView<AgentRegisterController> {
  const RegisterStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'สถานภาพ',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'สถานภาพ',
            isHorizontal: true,
            required: true,
            field: AdminFormDropdown(
              name: 'status',
              label: "กรุณาใส่สถานภาพ",
              enabled: !controller.isLoading.value,
              items: [
                DropdownMenuItem(value: 'โสด', child: Text('โสด')),
                DropdownMenuItem(value: 'สมรส', child: Text('สมรส')),
                DropdownMenuItem(value: 'หย่าร้าง', child: Text('หย่าร้าง')),
                DropdownMenuItem(value: 'หม้าย', child: Text('หม้าย')),
              ],
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่สถานภาพ")]),
            ),
          ),
          AdminFormField(
            label: 'อื่นๆ',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'status_other',
              label: "กรุณาใส่อื่นๆ",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่อื่นๆ")]),
            ),
          ),
          AdminFormField(
            label: 'คำนำหน้า',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'prefix',
              label: "กรุณาใส่คำนำหน้า",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่คำนำหน้า")]),
            ),
          ),
          AdminFormField(
            label: 'ชื่อ',
            isHorizontal: true,
            required: false,
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
            required: false,
            field: AdminFormTextField(
              name: 'last_name',
              label: "กรุณาใส่นามสกุล",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่นามสกุล")]),
            ),
          ),
          AdminFormField(
            label: 'อีเมล',
            isHorizontal: true,
            required: false,
            field: AdminFormTextField(
              name: 'email',
              label: "กรุณาใส่อีเมล",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่อีเมล")]),
            ),
          ),
          AdminFormField(
            label: 'เบอร์โทรศัพท์',
            isHorizontal: true,
            required: false,
            field: AdminFormTextField(
              name: 'phone',
              label: "กรุณาใส่เบอร์โทรศัพท์",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่เบอร์โทรศัพท์"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
