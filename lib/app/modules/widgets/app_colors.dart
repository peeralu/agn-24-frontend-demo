import 'package:flutter/material.dart';

class AppColor {
  static const transparent = Colors.transparent;
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const background = Color.fromARGB(255, 246, 246, 246);

  static const primary = Color(0xFF405189);
  static const secondary = Color(0xFF3577F1);
  static const success = Color(0xFF0AB39C);
  static const info = Color(0xFF299CDB);
  static const warning = Color(0xFFF7B84B);
  static const danger = Color(0xFFF06548);
  static const light = Color(0xFFF3F6F9);
  static const dark = Color(0xFF212529);
  static const grey = Color(0xFF878A99);

  static const primaryText = Color(0xFF364574);
  static const secondaryText = Color(0xFF2D65CD);
  static const successText = Color(0xFF099885);
  static const infoText = Color(0xFF2385BA);
  static const warningText = Color(0xFFD29C40);
  static const dangerText = Color(0xFFCC563D);
  static const lightText = Color(0xFFCED4DA);
  static const darkText = Color(0xFF343A40);
  static const greyText = Color(0xFF6C757D);

  static const primarySoft = Color(0xFFE2E5ED);
  static const secondarySoft = Color(0xFFE1EBFD);
  static const successSoft = Color(0xFFDAF4F0);
  static const infoSoft = Color(0xFFDFF0FA);
  static const warningSoft = Color(0xFFFEF4E4);
  static const dangerSoft = Color(0xFFFDE8E4);
  static const lightSoft = Color(0xFFF9FBFC);
  static const darkSoft = Color(0xFFE9EBEC);
  static const greySoft = Color(0xFFF1F2F5);

  static const primaryBorder = Color(0xFFB3B9D0);
  static const secondaryBorder = Color(0xFFAEC9F9);
  static const successBorder = Color(0xFF9DE1D7);
  static const infoBorder = Color(0xFFA9D7F1);
  static const warningBorder = Color(0xFFFCE3B7);
  static const dangerBorder = Color(0xFFF9C1B6);
  static const lightBorder = Color(0xFFEFF2F7);
  static const darkBorder = Color(0xFFADB5BD);
  static const greyBorder = Color(0xFFDDE1E8);
}

enum AppColors {
  primary,
  secondary,
  success,
  info,
  warning,
  danger,
  light,
  dark,
  grey,
  white,
  black,
  transparent,
  background,
}

extension AppColorsextension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.primary:
        return AppColor.primary;
      case AppColors.secondary:
        return AppColor.secondary;
      case AppColors.success:
        return AppColor.success;
      case AppColors.info:
        return AppColor.info;
      case AppColors.warning:
        return AppColor.warning;
      case AppColors.danger:
        return AppColor.danger;
      case AppColors.light:
        return AppColor.light;
      case AppColors.dark:
        return AppColor.dark;
      case AppColors.grey:
        return AppColor.grey;
      case AppColors.white:
        return AppColor.white;
      case AppColors.black:
        return AppColor.black;
      case AppColors.transparent:
        return AppColor.transparent;
      case AppColors.background:
        return AppColor.background;
    }
  }

  Color get soft {
    switch (this) {
      case AppColors.primary:
        return AppColor.primarySoft;
      case AppColors.secondary:
        return AppColor.secondarySoft;
      case AppColors.success:
        return AppColor.successSoft;
      case AppColors.info:
        return AppColor.infoSoft;
      case AppColors.warning:
        return AppColor.warningSoft;
      case AppColors.danger:
        return AppColor.dangerSoft;
      case AppColors.light:
        return AppColor.lightSoft;
      case AppColors.dark:
        return AppColor.darkSoft;
      case AppColors.grey:
        return AppColor.greySoft;
      case AppColors.white:
        return AppColor.white;
      case AppColors.black:
        return AppColor.black;
      case AppColors.transparent:
        return AppColor.transparent;
      case AppColors.background:
        return AppColor.background;
    }
  }

  Color get text {
    switch (this) {
      case AppColors.primary:
        return AppColor.primaryText;
      case AppColors.secondary:
        return AppColor.secondaryText;
      case AppColors.success:
        return AppColor.successText;
      case AppColors.info:
        return AppColor.infoText;
      case AppColors.warning:
        return AppColor.warningText;
      case AppColors.danger:
        return AppColor.dangerText;
      case AppColors.light:
        return AppColor.lightText;
      case AppColors.dark:
        return AppColor.darkText;
      case AppColors.grey:
        return AppColor.greyText;
      case AppColors.white:
        return AppColor.white;
      case AppColors.black:
        return AppColor.black;
      case AppColors.transparent:
        return AppColor.transparent;
      case AppColors.background:
        return AppColor.background;
    }
  }

  Color get border {
    switch (this) {
      case AppColors.primary:
        return AppColor.primaryBorder;
      case AppColors.secondary:
        return AppColor.secondaryBorder;
      case AppColors.success:
        return AppColor.successBorder;
      case AppColors.info:
        return AppColor.infoBorder;
      case AppColors.warning:
        return AppColor.warningBorder;
      case AppColors.danger:
        return AppColor.dangerBorder;
      case AppColors.light:
        return AppColor.lightBorder;
      case AppColors.dark:
        return AppColor.darkBorder;
      case AppColors.grey:
        return AppColor.greyBorder;
      case AppColors.white:
        return AppColor.white;
      case AppColors.black:
        return AppColor.black;
      case AppColors.transparent:
        return AppColor.transparent;
      case AppColors.background:
        return AppColor.background;
    }
  }
}

extension AppColorsIconX on AppColors {
  IconData get icon {
    switch (this) {
      case AppColors.primary:
        return Icons.star_outline;
      case AppColors.secondary:
        return Icons.layers_outlined;
      case AppColors.success:
        return Icons.check_circle_outline;
      case AppColors.info:
        return Icons.info_outline;
      case AppColors.warning:
        return Icons.warning_amber_outlined;
      case AppColors.danger:
        return Icons.error_outline;
      case AppColors.light:
        return Icons.light_mode_outlined;
      case AppColors.dark:
        return Icons.dark_mode_outlined;
      case AppColors.grey:
        return Icons.grain_outlined;
      case AppColors.white:
        return Icons.circle_outlined;
      case AppColors.black:
        return Icons.circle_outlined;
      case AppColors.transparent:
        return Icons.circle_outlined;
      case AppColors.background:
        return Icons.circle_outlined;
    }
  }
}

extension AppColorsButtonX on AppColors {
  ButtonStyle solidButton({
    bool fullWidth = false,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ).copyWith(
      minimumSize: fullWidth ? WidgetStateProperty.all(const Size.fromHeight(40)) : null,
      overlayColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.pressed) ? Colors.black.withAlpha(20) : null,
      ),
    );
  }
}

extension AppColorsSoftButtonX on AppColors {
  ButtonStyle softButton({EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12)}) {
    return ElevatedButton.styleFrom(
      backgroundColor: soft,
      foregroundColor: text,
      elevation: 0,
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.hovered) ? color.withAlpha(20) : null,
      ),
    );
  }
}

extension AppColorsOutlineButtonX on AppColors {
  ButtonStyle outlineButton({EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12)}) {
    return OutlinedButton.styleFrom(
      foregroundColor: color,
      padding: padding,
      side: BorderSide(color: border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}
