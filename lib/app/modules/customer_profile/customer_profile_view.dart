import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/app/modules/widgets/widgets.dart';

import 'customer_profile_controller.dart';

class CustomerProfileView extends GetView<CustomerProfileController> {
  const CustomerProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ข้อมูลส่วนตัวลูกค้า", child: ContentView());
  }
}

class ContentView extends GetView<CustomerProfileController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ PROFILE CARD
            if (isWide) Expanded(flex: 3, child: _buildProfileCard(context)),

            const SizedBox(width: 16),

            // ✅ PROFILE FORM
            Expanded(
              flex: 7,
              child: Card(
                elevation: 0,
                color: AppColors.secondary.soft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.secondary.border, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "แก้ไขข้อมูลส่วนตัว",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: FormBuilderTextField(
                                name: 'first_name',
                                decoration: const InputDecoration(labelText: "ชื่อ"),
                                validator: FormBuilderValidators.required(errorText: "กรุณากรอกชื่อ"),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: FormBuilderTextField(
                                name: 'last_name',
                                decoration: const InputDecoration(labelText: "นามสกุล"),
                                validator: FormBuilderValidators.required(errorText: "กรุณากรอกนามสกุล"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          name: 'email',
                          decoration: const InputDecoration(labelText: "อีเมล"),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(errorText: "กรุณากรอกอีเมล"),
                            FormBuilderValidators.email(errorText: "อีเมลไม่ถูกต้อง"),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: const InputDecoration(labelText: "เบอร์โทรศัพท์"),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(errorText: "กรุณากรอกเบอร์โทร"),
                            FormBuilderValidators.minLength(9),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          name: 'address',
                          decoration: const InputDecoration(labelText: "ที่อยู่"),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 32),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              AppDialog.showSuccess(
                                title: "บันทึกสำเร็จ",
                                message: "ข้อมูลส่วนตัวถูกบันทึกเรียบร้อยแล้ว",
                              );
                            },
                            icon: const Icon(Icons.save_outlined),
                            label: const Text("บันทึกข้อมูล"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// ✅ สร้างบัตรโปรไฟล์
  Widget _buildProfileCard(BuildContext context) {
    return Card(
      color: AppColors.primary.color.withAlpha(30),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.primary.color.withAlpha(30), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(radius: 48, backgroundImage: AssetImage('assets/images/avatar.png')),
            const SizedBox(height: 16),
            Text("นายสมชาย ใจดี", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              "somchai@example.com",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "สถานะ: ใช้งานอยู่",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            ListTile(
              leading: Icon(Icons.badge_outlined, color: AppColors.secondary.text.withAlpha(30)),
              title: const Text("รหัสลูกค้า: CUST-001234"),
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined, color: AppColors.secondary.text.withAlpha(30)),
              title: const Text("วันที่สมัคร: 01/08/2023"),
            ),
          ],
        ),
      ),
    );
  }
}
