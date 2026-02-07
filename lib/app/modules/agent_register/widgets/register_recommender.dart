import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterRecommenderWidget extends GetView<AgentRegisterController> {
  const RegisterRecommenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ข้อมูลผู้แนะนำ',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'คนแนะนำ',
            isHorizontal: true,
            required: true,
            field: AdminFormDropdown(
              name: 'recommender',
              label: "กรุณาเลือกคนแนะนำ",
              enabled: !controller.isLoading.value,
              items: [
                DropdownMenuItem(value: 'นาย', child: Text('นาย')),
                DropdownMenuItem(value: 'นางสาว', child: Text('นางสาว')),
                DropdownMenuItem(value: 'นาง', child: Text('นาง')),
              ],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาเลือกคนแนะนำ"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'หัวหน้า',
            isHorizontal: true,
            required: true,
            field: AdminFormDropdown(
              name: 'upline',
              label: "กรุณาเลือกหัวหน้า",
              enabled: !controller.isLoading.value,
              items: [
                DropdownMenuItem(value: 'นาย', child: Text('นาย')),
                DropdownMenuItem(value: 'นางสาว', child: Text('นางสาว')),
                DropdownMenuItem(value: 'นาง', child: Text('นาง')),
              ],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาเลือกหัวหน้า"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
