import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:frontend/app/lib_view.dart';

class AdminFormSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final Widget? footer;
  final GlobalKey<FormBuilderState>? formKey;
  final GestureTapCallback? onSumbit;
  final GestureTapCallback? onCancel;

  const AdminFormSection({
    super.key,
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.footer,
    this.formKey,
    this.onSumbit,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.info.soft,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Text(
                title.toUpperCase(),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: AppColors.info.color,
                ),
              ),
            ),

            AppSpace.vertical.m,

            Padding(
              padding: padding,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
            ),

            footer ?? AdminFormSubmit(onSumbit: onSumbit ?? () {}, onCancel: onCancel ?? () {}),
          ],
        ),
      ),
    );
  }
}

class AdminFormField extends StatelessWidget {
  final String label;
  final Widget field;
  final bool required;
  final double labelWidth;
  final double spacing;
  final bool isHorizontal;

  const AdminFormField({
    super.key,
    required this.label,
    required this.field,
    this.required = false,
    this.labelWidth = 160,
    this.spacing = 16,
    this.isHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return isHorizontal ? _buildHorizontalWidget(theme) : _buildVerticalWidget(theme);
  }

  Widget _buildHorizontalWidget(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: labelWidth,
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                text: label,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: Colors.black87),
                children: [
                  TextSpan(
                    text: ":",
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800, color: Colors.black87),
                  ),
                  if (required)
                    TextSpan(
                      text: "*",
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800, color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(width: spacing),
          Expanded(child: field),
        ],
      ),
    );
  }

  Widget _buildVerticalWidget(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          [
            label.titleMedium.bold.color(Colors.black87),
            ":".titleMedium.bold.color(Colors.black87),
            if (required) "*".titleMedium.bold.color(Colors.red),
          ].rich(),
          SizedBox(height: spacing),
          field,
        ],
      ),
    );
  }
}

class AdminFormDivider extends StatelessWidget {
  const AdminFormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Divider(height: 0.5, color: Colors.grey.withAlpha(50)),
    );
  }
}

class AdminFormSubmit extends StatelessWidget {
  final GestureTapCallback onSumbit;
  final GestureTapCallback? onCancel;

  const AdminFormSubmit({super.key, required this.onSumbit, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 200),
            AppButton(text: 'บันทึก', status: AppColors.primary, icon: AppColors.primary.icon, onPressed: onSumbit),
            AppSpace.horizontal.md,
            AppButton(text: 'ยกเลิก', status: AppColors.grey, icon: AppColors.grey.icon, onPressed: onCancel),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
