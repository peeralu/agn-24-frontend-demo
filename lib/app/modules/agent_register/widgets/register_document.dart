import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterDocumentWidget extends GetView<AgentRegisterController> {
  const RegisterDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'เอกสาร',
        formKey: controller.getFormKey(),
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'สำเนาบัตรประจำตัวประชาชน',
            isHorizontal: true,
            required: true,
            field: AdminFormUploadField(name: 'id_card_copy', label: "กรุณาอัปโหลดสำเนาบัตรประจำตัวประชาชน"),
          ),

          AdminFormDivider(),

          AdminFormField(
            label: 'สำเนาทะเบียนบ้าน',
            isHorizontal: true,
            required: true,
            field: AdminFormUploadField(name: 'house_registration_copy', label: "กรุณาอัปโหลดสำเนาทะเบียนบ้าน"),
          ),

          AdminFormDivider(),

          AdminFormField(
            label: 'สำเนาบัตรนายหน้า',
            isHorizontal: true,
            required: true,
            field: AdminFormUploadField(name: 'agent_card_copy', label: "กรุณาอัปโหลดสำเนาบัตรนายหน้า"),
          ),

          AdminFormDivider(),

          AdminFormField(
            label: 'สำเนาหน้า บัญชี ธนาคาร',
            isHorizontal: true,
            required: true,
            field: AdminFormUploadField(name: 'bank_account_copy', label: "กรุณาอัปโหลดสำเนาหน้า บัญชี ธนาคาร"),
          ),

          AdminFormDivider(),

          AdminFormField(
            label: 'รูปถ่ายถือบัตรประชาชน',
            isHorizontal: true,
            required: true,
            field: AdminFormUploadField(name: 'id_card_photo', label: "กรุณาอัปโหลดรูปถ่ายถือบัตรประชาชน"),
          ),
        ],
      ),
    );
  }
}
