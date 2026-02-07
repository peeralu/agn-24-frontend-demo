import 'package:frontend/app/lib_view.dart';

enum AppButtonVariant { solid, soft, outline }

enum AppButtonSize { none, sm, md, lg }

extension AppButtonSizeExtension on AppButtonSize {
  Size? get minimumSize {
    switch (this) {
      case AppButtonSize.sm:
        return Size(80, 32);
      case AppButtonSize.md:
        return Size(120, 32);
      case AppButtonSize.lg:
        return Size(160, 32);
      default:
        return null;
    }
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppColors status;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool isFullWidth;
  final bool isLoading;
  final bool isEnabled;
  final EdgeInsets padding;
  final AppButtonSize size;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.status,
    this.variant = AppButtonVariant.solid,
    this.icon,
    this.isFullWidth = false,
    this.isLoading = false,
    this.isEnabled = true,
    this.padding = _defaultPadding,
    this.size = AppButtonSize.none,
  });

  static const EdgeInsets _defaultPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 16);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disable = isLoading || !isEnabled;
    final button = ElevatedButton(
      onPressed: disable ? null : onPressed,
      style: _style(theme),
      child: _buildChild(theme),
    );

    if (!isFullWidth) return button;

    return SizedBox(width: double.infinity, child: button);
  }

  ButtonStyle _style(ThemeData theme) {
    final disable = isLoading || !isEnabled;
    switch (variant) {
      case AppButtonVariant.soft:
        return ElevatedButton.styleFrom(
          backgroundColor: status.soft,
          foregroundColor: status.text,
          elevation: 0,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.sm),
            side: BorderSide(color: disable ? AppColor.transparent : status.border, width: 1.5),
          ),
          textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          minimumSize: size.minimumSize,
        );

      case AppButtonVariant.outline:
        return OutlinedButton.styleFrom(
          foregroundColor: status.color,
          padding: padding,
          side: BorderSide(color: disable ? AppColor.transparent : status.border, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.sm)),
          textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          minimumSize: size.minimumSize,
        );

      case AppButtonVariant.solid:
        return ElevatedButton.styleFrom(
          backgroundColor: status.color,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.sm)),
          textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          minimumSize: size.minimumSize,
        );
    }
  }

  Widget _buildChild(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(variant == AppButtonVariant.solid ? Colors.white : status.text),
        ),
      );
    }

    if (icon == null) {
      return Text(text);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: variant == AppButtonVariant.solid ? Colors.white : status.text),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
