import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterAuthWidget extends GetView<AgentRegisterController> {
  const RegisterAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegExp thaiPhoneRegExp = RegExp(r'^(?:\+66|0)(6|8|9)\d{8}$');
    final RegExp emailRegExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    final RegExp lineIdRegExp = RegExp(r'^[a-zA-Z0-9._-]{3,20}$');
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ข้อมูลการเข้าสู่ระบบ',
        formKey: controller.formAuthKey,
        footer: RegisterAction(isFisrtStep: true, isLastStep: false),
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
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่รหัสผ่าน")]),
            ),
          ),
          AdminFormField(
            label: 'ยืนยันรหัสผ่าน',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'confirm_password',
              label: "กรุณาใส่รหัสผ่านอีกครั้ง",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่รหัสผ่านอีกครั้ง"),
              ]),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }

                if (!emailRegExp.hasMatch(value)) {
                  return 'อีเมลไม่ถูกต้อง';
                }

                return null;
              },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }

                if (!thaiPhoneRegExp.hasMatch(value)) {
                  return "เบอร์โทรศัพท์ไม่ถูกต้อง";
                }

                return null;
              },
            ),
          ),
          AdminFormField(
            label: 'Line ID',
            isHorizontal: true,
            required: false,
            field: AdminFormTextField(
              name: 'line_id',
              label: "กรุณาใส่ Line ID",
              enabled: !controller.isLoading.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }

                if (!lineIdRegExp.hasMatch(value)) {
                  return "Line ID ไม่ถูกต้อง";
                }

                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
