import 'package:flutter/material.dart';

import 'package:frontend/theme.dart';

class AdminCard extends StatelessWidget {
  final Widget? child;
  final BoxConstraints? constraints;
  final double? elevation;
  final Color? color;
  const AdminCard({super.key, this.child, this.constraints, this.elevation, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: BoxDecoration(
        color: color ?? AppColors.surface,
        borderRadius: BorderRadius.circular(elevation ?? 8),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: child,
    );
  }
}
