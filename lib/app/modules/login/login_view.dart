import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:frontend/app/modules/widgets/widgets.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.soft,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/bg.jpg'), fit: BoxFit.cover, opacity: 0.4),
              ),
              padding: EdgeInsets.all(AppSize.xl),
              child: Center(
                child: AdminCard(
                  elevation: 8,
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(children: [if (Get.width >= 874) _buildCarouselSlider(), _buildFormSection()]),
                ),
              ),
            ),
          ),
          _buildFlooter(),
        ],
      ),
    );
  }

  Expanded _buildFormSection() {
    return Expanded(
      child: SizedBox(
        height: 700,
        child: FormBuilder(
          key: controller.formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                AppSpace.vertical.xxl,
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset('images/logo.png', width: 100, height: 100),
                  ),
                ),

                AppSpace.vertical.m,

                Text(
                  "ระบบบริหารจัดการประกันภัย",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary.color),
                ),

                AppSpace.vertical.s,

                Text(
                  "เข้าสู่ระบบบัญชีของคุณ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.primary.color.withValues(alpha: 0.4)),
                ),

                AppSpace.vertical.xxl,

                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "อีเมล์",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary.color),
                  ),
                ),
                AppSpace.vertical.s,
                Obx(() {
                  return AdminFormTextField(
                    name: 'email',
                    label: "กรุณาใส่อีเมล์",
                    initialValue: 'demo',
                    prefix: Icon(Icons.email_outlined, color: AppColors.primary.color),
                    enabled: !controller.isLoading.value,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: "กรุณาใส่อีเมล์"),
                      // FormBuilderValidators.email(errorText: "รูปแบบอีเมล์ไม่ถูกต้อง"),
                    ]),
                  );
                }),

                AppSpace.vertical.m,

                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "รหัสผ่าน",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary.color),
                  ),
                ),
                AppSpace.vertical.s,
                Obx(() {
                  return AdminFormTextField(
                    name: 'password',
                    label: "กรุณาใส่รหัสผ่าน",
                    initialValue: 'demo',
                    prefix: Icon(Icons.lock_outline, color: AppColors.primary.color),
                    suffix: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primary.color,
                      ),
                      onPressed: controller.onTogglePasswordVisibilityTap,
                    ),
                    obscureText: controller.obscurePassword.value,
                    enabled: !controller.isLoading.value,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: "กรุณาใส่รหัสผ่าน"),
                      FormBuilderValidators.minLength(4, errorText: "รหัสผ่านต้องมีความยาวอย่างน้อย 4 ตัวอักษร"),
                      FormBuilderValidators.maxLength(20, errorText: "รหัสผ่านต้องมีความยาวไม่เกิน 20 ตัวอักษร"),
                    ]),
                  );
                }),

                AppSpace.vertical.m,

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TextButton(
                    //   onPressed: controller.onSignUpTap,
                    //   child: Text("สมัครสมาชิก", style: TextStyle(color: AppColors.primary.color)),
                    // ),
                    TextButton(
                      onPressed: controller.onForgotPasswordTap,
                      child: Text("ลืมรหัสผ่าน?", style: TextStyle(color: AppColors.primary.color)),
                    ),
                  ],
                ),

                AppSpace.vertical.m,

                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      text: "เข้าสู่ระบบ",
                      onPressed: controller.onLoginTap,
                      isLoading: controller.isLoading.value,
                      status: AppColors.primary,
                    ),
                  );
                }),
                AppSpace.vertical.l,

                Spacer(),

                Text(
                  "v.${controller.appVersion}",
                  style: TextStyle(color: AppColors.primary.color.withAlpha(220), fontSize: 12),
                ),

                AppSpace.vertical.m,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildCarouselSlider() {
    return Expanded(
      child: Container(
        height: 700,
        color: Color.fromARGB(255, 247, 250, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.images.isEmpty) {
                return SizedBox(
                  height: 526,
                  child: Center(
                    child: Text("ไม่มีรูปภาพโฆษณา", style: TextStyle(color: AppColors.primary.text.withAlpha(100))),
                  ),
                );
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 500,
                  aspectRatio: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: Duration(seconds: 10),
                  autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  onPageChanged: (index, reason) {
                    controller.onChangeImageIndex(index);
                  },
                ),
                items: controller.images
                    .map(
                      (item) => Center(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primary.soft, width: 5),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: item,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Shimmer(
                              duration: Duration(seconds: 2),
                              color: Colors.grey[100]!,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(color: Colors.grey[300], width: double.infinity),
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }),
            AppSpace.vertical.s,
            Obx(() {
              if (controller.images.isEmpty) {
                return SizedBox.shrink();
              }
              return AnimatedSmoothIndicator(
                activeIndex: controller.imagesIndex.value,
                count: controller.images.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.primary.color,
                  dotColor: AppColors.primary.color.withAlpha(100),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFlooter() {
    final year = DateTime.now().year + 543;
    return Container(
      height: 50,
      color: AppColors.primary.color,
      padding: EdgeInsets.symmetric(horizontal: AppSize.lg),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "สงวนลิขสิทธิ์ © $year บริษัท เซ็นทรัล อินชัวรันส์ โบรคเกอร์ จำกัด.",
            overflow: TextOverflow.fade,
            style: TextStyle(color: AppColors.primary.text, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
