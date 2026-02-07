import 'package:flutter/material.dart';

import 'package:frontend/theme.dart';

class AdminPagination extends StatelessWidget {
  final int page; // 0-based
  final int totalPages;
  final ValueChanged<int> onChange;
  final int siblingCount;

  const AdminPagination({
    super.key,
    required this.page,
    required this.totalPages,
    required this.onChange,
    this.siblingCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    Widget button({required Widget child, VoidCallback? onTap, bool active = false, bool disabled = false}) {
      return InkWell(
        onTap: disabled ? null : onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: 36,
          height: 36,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: active
                ? AppColors.primaryLight
                : disabled
                ? Colors.grey.shade100
                : Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: active
                    ? Colors.white
                    : disabled
                    ? Colors.grey
                    : Colors.black87,
              ),
              child: child,
            ),
          ),
        ),
      );
    }

    List<Widget> items = [];

    // First
    items.add(button(child: const Text('«'), onTap: page > 0 ? () => onChange(0) : null, disabled: page == 0));

    // Prev
    items.add(button(child: const Text('‹'), onTap: page > 0 ? () => onChange(page - 1) : null, disabled: page == 0));

    // Pages
    final start = (page - siblingCount).clamp(0, totalPages - 1);
    final end = (page + siblingCount).clamp(0, totalPages - 1);

    if (start > 0) {
      items.add(button(child: const Text('1'), onTap: () => onChange(0)));
      if (start > 1) {
        items.add(const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text('…')));
      }
    }

    for (int i = start; i <= end; i++) {
      items.add(button(child: Text('${i + 1}'), active: i == page, onTap: () => onChange(i)));
    }

    if (end < totalPages - 1) {
      if (end < totalPages - 2) {
        items.add(const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text('…')));
      }
      items.add(button(child: Text('$totalPages'), onTap: () => onChange(totalPages - 1)));
    }

    // Next
    items.add(
      button(
        child: const Text('›'),
        onTap: page < totalPages - 1 ? () => onChange(page + 1) : null,
        disabled: page >= totalPages - 1,
      ),
    );

    // Last
    items.add(
      button(
        child: const Text('»'),
        onTap: page < totalPages - 1 ? () => onChange(totalPages - 1) : null,
        disabled: page >= totalPages - 1,
      ),
    );

    return Row(mainAxisAlignment: MainAxisAlignment.end, children: items);
  }
}
