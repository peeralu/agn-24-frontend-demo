import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_action.dart';

class RegisterCurrentAddressWidget extends GetView<AgentRegisterController> {
  const RegisterCurrentAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdminFormSection(
        title: 'ที่อยู่ปัจจุบัน',
        formKey: controller.formCurrentAddressKey,
        footer: RegisterAction(isFisrtStep: false, isLastStep: false),
        children: [
          AdminFormField(
            label: 'บ้านเลขที่',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_house_number',
              label: "กรุณาใส่บ้านเลขที่",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่บ้านเลขที่"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'หมู่ที่',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_village_number',
              label: "กรุณาใส่หมู่ที่",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่หมู่ที่")]),
            ),
          ),
          AdminFormField(
            label: 'อาคาร/หมู่บ้าน',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_building',
              label: "กรุณาใส่อาคาร/หมู่บ้าน",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่อาคาร/หมู่บ้าน"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'ชั้นที่',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_floor',
              label: "กรุณาใส่ชั้นที่",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่ชั้นที่")]),
            ),
          ),
          AdminFormField(
            label: 'ตรอก/ซอย',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_alley',
              label: "กรุณาใส่ตรอก/ซอย",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่ตรอก/ซอย")]),
            ),
          ),
          AdminFormField(
            label: 'ถนน',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_road',
              label: "กรุณาใส่ถนน",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่ถนน")]),
            ),
          ),
          AdminFormField(
            label: 'จังหวัด',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_province',
              label: "กรุณาใส่จังหวัด",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: "กรุณาใส่จังหวัด")]),
            ),
          ),
          AdminFormField(
            label: 'อำเภอ/เขต',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_district',
              label: "กรุณาใส่อำเภอ/เขต",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่อำเภอ/เขต"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'ตำบล/แขวง',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_subdistrict',
              label: "กรุณาใส่ตำบล/แขวง",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่ตำบล/แขวง"),
              ]),
            ),
          ),
          AdminFormField(
            label: 'รหัสไปรษณีย์',
            isHorizontal: true,
            required: true,
            field: AdminFormTextField(
              name: 'current_postal_code',
              label: "กรุณาใส่รหัสไปรษณีย์",
              enabled: !controller.isLoading.value,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "กรุณาใส่รหัสไปรษณีย์"),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
