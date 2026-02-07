import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'agent_profile_controller.dart';

class AgentProfileView extends GetView<AgentProfileController> {
  const AgentProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ข้อมูลส่วนตัวตัวแทน", child: ContentView());
  }
}

class ContentView extends GetView<AgentProfileController> {
  ContentView({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Layout 2 Columns
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              return Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Profile Summary Card
                  Expanded(
                    flex: 3,
                    child: Card(
                      color: AppColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.border, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                const CircleAvatar(radius: 55, backgroundImage: AssetImage("assets/images/avatar.png")),
                                Positioned(
                                  bottom: 0,
                                  right: 4,
                                  child: InkWell(
                                    onTap: () {
                                      Get.snackbar(
                                        "เปลี่ยนรูปโปรไฟล์",
                                        "ฟีเจอร์นี้กำลังพัฒนาอยู่ 😊",
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
                                      child: const Icon(Icons.edit, color: Colors.white, size: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "นายอดิศักดิ์ ตัวแทนทองคำ",
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "รหัสตัวแทน: AGT-202312",
                              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "สถานะ: เปิดใช้งาน",
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Divider(),
                            const SizedBox(height: 12),
                            _infoRow(Icons.email_outlined, "อีเมล", "adisak.agent@example.com"),
                            _infoRow(Icons.phone_outlined, "เบอร์โทร", "089-123-4567"),
                            _infoRow(Icons.calendar_today_outlined, "วันที่สมัคร", "12 กุมภาพันธ์ 2024"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24, height: 24),

                  // 🔹 Profile Form Card
                  Expanded(
                    flex: 7,
                    child: Card(
                      color: AppColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.border, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: FormBuilder(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "แก้ไขข้อมูลส่วนตัว",
                                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 24),

                              // 🔸 Form Fields
                              Row(
                                children: [
                                  Expanded(
                                    child: FormBuilderTextField(
                                      name: 'first_name',
                                      decoration: const InputDecoration(labelText: "ชื่อ"),
                                      validator: FormBuilderValidators.required(errorText: "กรุณากรอกชื่อ"),
                                      initialValue: "อดิศักดิ์",
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: FormBuilderTextField(
                                      name: 'last_name',
                                      decoration: const InputDecoration(labelText: "นามสกุล"),
                                      validator: FormBuilderValidators.required(errorText: "กรุณากรอกนามสกุล"),
                                      initialValue: "ใจดี",
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
                                  FormBuilderValidators.email(errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                                ]),
                                initialValue: "adisak.agent@example.com",
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: 'phone',
                                decoration: const InputDecoration(labelText: "เบอร์โทรศัพท์"),
                                validator: FormBuilderValidators.required(errorText: "กรุณากรอกเบอร์โทร"),
                                initialValue: "089-123-4567",
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: 'address',
                                decoration: const InputDecoration(labelText: "ที่อยู่"),
                                maxLines: 2,
                                initialValue: "123/45 หมู่บ้านแสนสุข แขวงคลองสาน เขตธนบุรี กรุงเทพฯ",
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: 'bank_account',
                                decoration: const InputDecoration(labelText: "บัญชีธนาคารรับคอมมิชชั่น"),
                                validator: FormBuilderValidators.required(errorText: "กรุณากรอกเลขบัญชี"),
                                initialValue: "กสิกรไทย - 012-345-6789",
                              ),
                              const SizedBox(height: 32),

                              // ✅ Save Button
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                                      Get.snackbar(
                                        "บันทึกสำเร็จ",
                                        "ข้อมูลถูกบันทึกเรียบร้อยแล้ว",
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }
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
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  /// 🔸 แถวข้อมูลสรุป (ใน Profile Card)
  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text("$label: ", style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 2,
            child: Text(value, style: const TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }
}
