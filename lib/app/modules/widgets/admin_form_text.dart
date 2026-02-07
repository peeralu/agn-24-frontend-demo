import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class AdminFormTextField extends StatelessWidget {
  final String name;
  final String label;
  final String initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obscureText;
  final bool? enabled;
  final FormFieldValidator<String?>? validator;
  final void Function(String? value)? onChanged;

  const AdminFormTextField({
    super.key,
    required this.name,
    required this.label,
    this.initialValue = "",
    this.prefix,
    this.suffix,
    this.obscureText,
    this.enabled,
    this.validator,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: key,
      name: name,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black54, letterSpacing: 0.2),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      enabled: enabled ?? true,
      validator: validator,
    );
  }
}
