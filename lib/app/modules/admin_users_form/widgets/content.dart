import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:frontend/app/lib_view.dart';

import '../admin_users_form_controller.dart';

class ContentView extends GetView<AdminUsersFormController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: Obx(() {
              return AdminFormSection(
                title: 'แก้ไขผู้ใช้งาน',
                formKey: controller.formKey,
                children: [
                  AdminFormField(
                    label: 'ชื่อผู้ใช้งาน',
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
                    label: 'รหัสผ่าน',
                    isHorizontal: true,
                    required: true,
                    field: AdminFormTextField(
                      name: 'password',
                      label: "กรุณาใส่รหัสผ่าน",
                      enabled: !controller.isLoading.value,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "กรุณาใส่รหัสผ่าน"),
                      ]),
                    ),
                  ),
                  AdminFormField(
                    label: 'รหัสผ่าน',
                    isHorizontal: true,
                    required: true,
                    field: AdminFormTextField(
                      name: 'confirm_password',
                      label: "กรุณาใส่รหัสผ่าน",
                      enabled: !controller.isLoading.value,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "กรุณาใส่รหัสผ่าน"),
                      ]),
                    ),
                  ),

                  const AdminFormDivider(),

                  AdminFormField(
                    label: 'ชื่อ',
                    isHorizontal: true,
                    required: true,
                    field: AdminFormTextField(
                      name: 'first_name',
                      label: "กรุณาใส่ชื่อ",
                      enabled: !controller.isLoading.value,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "กรุณาใส่ชื่อ"),
                      ]),
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
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "กรุณาใส่นามสกุล"),
                      ]),
                    ),
                  ),

                  AdminFormField(
                    label: 'สิทธิการเข้าใช้งาน',
                    isHorizontal: true,
                    required: true,
                    field: AdminFormDropdown(
                      name: 'role',
                      label: "กรุณาใส่สิทธิการเข้าใช้งาน",
                      enabled: !controller.isLoading.value,
                      items: const [
                        DropdownMenuItem(value: 'admin', child: Text('ผู้ดูแลระบบ')),
                        DropdownMenuItem(value: 'agent', child: Text('ตัวแทนขาย')),
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "กรุณาใส่สิทธิการเข้าใช้งาน"),
                      ]),
                    ),
                  ),
                ],
              );
            }),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
