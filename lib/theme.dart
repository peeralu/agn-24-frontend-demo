import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFD6D8DD);

  static const Color textPrimary = Color.fromARGB(255, 47, 47, 47);
  static const Color textSecondary = Color(0xFF555555);

  static const Color primary = Color(0xFF29346A);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF5C6BC0);

  static const Color secondary = Color(0xFF26A69A);
  static const Color accent = primary;

  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFFFB300);
  static const Color danger = Color(0xFFE53935);
  static const Color info = Color(0xFF29B6F6);

  static const Color onPrimary = Colors.white;
  static const Color onSurface = Color(0xFF1E1E1E);

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF555555);
  static const Color dark = Color(0xFF333333);
}

final TextTheme baseTextTheme = TextTheme(
  displayLarge: GoogleFonts.sarabun(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25),
  displayMedium: GoogleFonts.sarabun(fontSize: 45, fontWeight: FontWeight.w400),
  displaySmall: GoogleFonts.sarabun(fontSize: 36, fontWeight: FontWeight.w400),
  headlineLarge: GoogleFonts.sarabun(fontSize: 32, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.sarabun(fontSize: 28, fontWeight: FontWeight.w400),
  headlineSmall: GoogleFonts.sarabun(fontSize: 24, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.sarabun(fontSize: 22, fontWeight: FontWeight.w500),
  titleMedium: GoogleFonts.sarabun(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleSmall: GoogleFonts.sarabun(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.sarabun(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.sarabun(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  bodySmall: GoogleFonts.sarabun(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelLarge: GoogleFonts.sarabun(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  labelMedium: GoogleFonts.sarabun(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
  labelSmall: GoogleFonts.sarabun(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
);

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.background,

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.danger,
    onError: AppColors.onPrimary,
  ),

  textTheme: baseTextTheme,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.textPrimary,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primary),
      foregroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border, width: 1),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
    labelStyle: const TextStyle(color: AppColors.textSecondary),
    prefixIconColor: AppColors.textSecondary,
  ),

  cardTheme: CardThemeData(
    color: AppColors.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: AppColors.border, width: 1),
    ),
  ),

  dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 0.8, space: 12),

  iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 22),

  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.textPrimary,
    contentTextStyle: TextStyle(color: Colors.white),
    behavior: SnackBarBehavior.floating,
  ),
);

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
