import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/data/services/auth_service.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

extension RegisterControllerAction on RegisterController {
  void onTogglePasswordVisibilityTap() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onRegisterTap() async {
    await AuthService.instance.signUp(usernameController.text, passwordController.text);
  }
}
