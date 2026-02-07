// ignore_for_file: unused_element, unused_field, library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';

class AppSize {
  static const xss = 2.0;
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 40.0;
  static const xxxl = 48.0;
  static const xxxxl = 56.0;
}

class AppSpace {
  static _AppSpaceHorizontal horizontal = _AppSpaceHorizontal();
  static _AppSpaceVertical vertical = _AppSpaceVertical();
}

class _AppSpaceHorizontal {
  SizedBox get xss => SizedBox(width: AppSize.xss);
  SizedBox get xs => SizedBox(width: AppSize.xs);
  SizedBox get sm => SizedBox(width: AppSize.sm);
  SizedBox get md => SizedBox(width: AppSize.md);
  SizedBox get lg => SizedBox(width: AppSize.lg);
  SizedBox get xl => SizedBox(width: AppSize.xl);
  SizedBox get xxl => SizedBox(width: AppSize.xxl);
  SizedBox get xxxl => SizedBox(width: AppSize.xxxl);
  SizedBox get xxxxl => SizedBox(width: AppSize.xxxxl);
}

class _AppSpaceVertical {
  SizedBox get xss => SizedBox(height: AppSize.xss);
  SizedBox get xs => SizedBox(height: AppSize.xs);
  SizedBox get s => SizedBox(height: AppSize.sm);
  SizedBox get m => SizedBox(height: AppSize.md);
  SizedBox get l => SizedBox(height: AppSize.lg);
  SizedBox get xl => SizedBox(height: AppSize.xl);
  SizedBox get xxl => SizedBox(height: AppSize.xxl);
  SizedBox get xxxl => SizedBox(height: AppSize.xxxl);
  SizedBox get xxxxl => SizedBox(height: AppSize.xxxxl);
}
