import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterAccountWidget extends GetView<AgentRegisterController> {
  const RegisterAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ข้อมูลการเข้าสู่ระบบ',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'ชื่อธนาคาร',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'bank_name',
              label: "กรุณาใส่ชื่อธนาคาร",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่ชื่อธนาคาร"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'สาขาธนาคาร',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'branch',
              label: "กรุณาใส่สาขาธนาคาร",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่สาขาธนาคาร"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'ชื่อบัญชี',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'account_name',
              label: "กรุณาใส่ชื่อบัญชี",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่ชื่อบัญชี"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'ประเภทบัญชี',
            isHorizontal: true,
            required: false,
            field: AdminFormTextField(
              name: 'account_type',
              label: "กรุณาใส่ประเภทบัญชี",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่ประเภทบัญชี"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'เลขที่บัญชี',
            isHorizontal: true,
            required: false,
            field: AdminFormTextField(
              name: 'account_number',
              label: "กรุณาใส่เลขที่บัญชี",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่เลขที่บัญชี"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
