import 'package:flutter/material.dart';

class AdminTableActions extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final double rowHeight;
  const AdminTableActions({super.key, this.onEdit, this.onDelete, required this.rowHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: rowHeight,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade300.withAlpha(200), width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          if (onEdit != null)
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: Colors.blueAccent.shade100, borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.white, size: 14),
                onPressed: onEdit,
              ),
            ),
          const SizedBox(width: 8),
          if (onDelete != null)
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: Colors.redAccent.shade100, borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.white, size: 14),
                onPressed: onDelete,
              ),
            ),
        ],
      ),
    );
  }
}
