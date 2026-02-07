import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import 'package:frontend/theme.dart';

class AppDialog {
  static BuildContext get _context => Get.context!;

  static Future<dynamic> showSuccess({
    String? title,
    required String message,
    VoidCallback? onOkTap,
    VoidCallback? onCancelTap,
    void Function(DismissType type)? onDismissCallback,
  }) async {
    return AwesomeDialog(
      context: _context,
      dialogType: DialogType.success,
      borderSide: const BorderSide(color: AppColors.success, width: 2),
      width: 640,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(4)),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      autoDismiss: true,
      autoHide: const Duration(seconds: 3),
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: title ?? "สำเร็จ",
      desc: message,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      titleTextStyle: Theme.of(
        _context,
      ).textTheme.titleLarge?.copyWith(color: AppColors.success, fontWeight: FontWeight.bold),
      descTextStyle: Theme.of(_context).textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
      showCloseIcon: onCancelTap != null,
      btnOkOnPress: onOkTap,
      btnCancelOnPress: onCancelTap,
      onDismissCallback: onDismissCallback,
      btnOkText: "ตกลง",
      btnCancelText: "ยกเลิก",
      btnOkColor: AppColors.success,
      btnCancelColor: AppColors.danger,
    ).show();
  }

  static void showWarning({
    String? title,
    required String message,
    VoidCallback? onOkTap,
    VoidCallback? onCancelTap,
    void Function(DismissType type)? onDismissCallback,
  }) {
    AwesomeDialog(
      context: _context,
      dialogType: DialogType.warning,
      borderSide: const BorderSide(color: AppColors.warning, width: 2),
      width: 640,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: title ?? "คำเตือน",
      desc: message,
      titleTextStyle: Theme.of(
        _context,
      ).textTheme.titleLarge?.copyWith(color: AppColors.warning, fontWeight: FontWeight.bold),
      descTextStyle: Theme.of(_context).textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      showCloseIcon: onCancelTap != null,
      btnOkOnPress: onOkTap,
      btnCancelOnPress: onCancelTap,
      onDismissCallback: onDismissCallback,
      btnOkText: "ตกลง",
      btnCancelText: "ยกเลิก",
      btnOkColor: AppColors.success,
      btnCancelColor: AppColors.danger,
    ).show();
  }

  static void showError({
    String? title,
    required String message,
    VoidCallback? onOkTap,
    VoidCallback? onCancelTap,
    void Function(DismissType type)? onDismissCallback,
  }) {
    AwesomeDialog(
      context: _context,
      dialogType: DialogType.error,
      borderSide: const BorderSide(color: AppColors.danger, width: 2),
      width: 640,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: title ?? "ผิดพลาด",
      desc: message,
      titleTextStyle: Theme.of(
        _context,
      ).textTheme.titleLarge?.copyWith(color: AppColors.danger, fontWeight: FontWeight.bold),
      descTextStyle: Theme.of(_context).textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
      showCloseIcon: onCancelTap != null,
      btnOkOnPress: onOkTap,
      btnCancelOnPress: onCancelTap,
      onDismissCallback: onDismissCallback,
      btnOkText: "ตกลง",
      btnCancelText: "ยกเลิก",
      btnOkColor: AppColors.success,
      btnCancelColor: AppColors.danger,
    ).show();
  }

  static void showInfo({
    String? title,
    required String message,
    VoidCallback? onOkTap,
    VoidCallback? onCancelTap,
    void Function(DismissType type)? onDismissCallback,
  }) {
    AwesomeDialog(
      context: _context,
      dialogType: DialogType.info,
      borderSide: const BorderSide(color: AppColors.info, width: 2),
      width: 640,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: title ?? "ข้อมูล",
      desc: message,
      titleTextStyle: Theme.of(
        _context,
      ).textTheme.titleLarge?.copyWith(color: AppColors.info, fontWeight: FontWeight.bold),
      descTextStyle: Theme.of(_context).textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
      showCloseIcon: onCancelTap != null,
      btnOkOnPress: onOkTap,
      btnCancelOnPress: onCancelTap,
      onDismissCallback: onDismissCallback,
      btnOkText: "ตกลง",
      btnCancelText: "ยกเลิก",
      btnOkColor: AppColors.success,
      btnCancelColor: AppColors.danger,
    ).show();
  }
}
