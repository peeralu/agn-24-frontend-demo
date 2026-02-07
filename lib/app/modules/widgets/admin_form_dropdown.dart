import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class AdminFormDropdown<T> extends StatelessWidget {
  final String name;
  final String label;
  final T? initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final List<DropdownMenuItem<T>> items;
  final bool? enabled;
  final FormFieldValidator<T?>? validator;
  final void Function(T? value)? onChanged;

  const AdminFormDropdown({
    super.key,
    required this.name,
    required this.label,
    this.initialValue,
    this.prefix,
    this.suffix,
    this.items = const [],
    this.enabled,
    this.validator,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      key: key,
      name: name,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black54, letterSpacing: 0.2),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      enabled: enabled ?? true,
      validator: validator,
      items: items,
    );
  }
}
