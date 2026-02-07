import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';

import 'package:frontend/theme.dart';

class AppToast {
  static void showSuccess({String? title, required String message}) {
    toastification.show(
      title: Text(title ?? "สำเร็จ"),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      direction: TextDirection.ltr,
      icon: Icon(Icons.check_circle_outline, color: AppColors.success),
    );
  }

  static void showWarning({String? title, required String message}) {
    toastification.show(
      title: Text(title ?? "คำเตือน"),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      direction: TextDirection.ltr,
      icon: Icon(Icons.warning_amber_rounded, color: AppColors.warning),
    );
  }

  static void showError({String? title, required String message}) {
    toastification.show(
      title: Text(title ?? "ผิดพลาด"),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      direction: TextDirection.ltr,
      icon: Icon(Icons.error_outline, color: AppColors.danger),
    );
  }

  static void showInfo({String? title, required String message}) {
    toastification.show(
      title: Text(title ?? "ข้อมูล"),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      direction: TextDirection.ltr,
      icon: Icon(Icons.info_outline, color: AppColors.info),
    );
  }
}
