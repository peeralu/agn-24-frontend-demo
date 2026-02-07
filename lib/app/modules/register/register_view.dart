import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/widgets/widgets.dart';

import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/bg.jpg'), fit: BoxFit.cover, opacity: 0.4),
        ),
        padding: EdgeInsets.all(AppSize.xl),
        child: Center(
          child: AdminCard(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SizedBox(
              height: 600,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Column(
                  children: [
                    Icon(Icons.lock_outline, size: 80, color: AppColor.primary),

                    AppSpace.vertical.m,

                    Text(
                      "ยินดีต้อนรับกลับมา 👋",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary.text),
                    ),

                    AppSpace.vertical.s,

                    Text("เข้าสู่ระบบบัญชีของคุณ", style: TextStyle(color: AppColors.primary.text.withAlpha(100))),

                    AppSpace.vertical.xxl,

                    TextField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        labelText: "ชื่อผู้ใช้",
                        prefixIcon: Icon(Icons.person_outline, color: AppColor.primary),
                      ),
                    ),

                    AppSpace.vertical.m,

                    Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        obscureText: controller.obscurePassword.value,
                        decoration: InputDecoration(
                          labelText: "รหัสผ่าน",
                          prefixIcon: Icon(Icons.lock_outline, color: AppColor.primary),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                              color: AppColor.primary,
                            ),
                            onPressed: controller.onTogglePasswordVisibilityTap,
                          ),
                        ),
                      ),
                    ),

                    AppSpace.vertical.m,

                    Obx(
                      () => TextField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.obscurePassword.value,
                        decoration: InputDecoration(
                          labelText: "ยืนยันรหัสผ่าน",
                          prefixIcon: Icon(Icons.lock_outline, color: AppColor.primary),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                              color: AppColor.primary,
                            ),
                            onPressed: controller.onTogglePasswordVisibilityTap,
                          ),
                        ),
                      ),
                    ),

                    AppSpace.vertical.m,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("เข้าสู่ระบบ", style: TextStyle(color: AppColor.primary)),
                        ),
                      ],
                    ),

                    AppSpace.vertical.m,

                    Obx(() {
                      return SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          text: "สมัครสมาชิก",
                          onPressed: controller.onRegisterTap,
                          isLoading: controller.isLoading.value,
                          status: AppColors.primary,
                        ),
                      );
                    }),
                    AppSpace.vertical.l,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
