import 'package:flutter/material.dart';

class InsuranceFilter extends StatelessWidget {
  const InsuranceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ตัวกรองการค้นหา", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                // controller.resetFilters();
              },
              child: Row(
                children: [
                  Icon(Icons.refresh, size: 18),
                  SizedBox(width: 4),
                  Text("รีเซ็ต", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
        buildDivider(),
        Row(
          children: [
            Text("ประเภทการซ่อม:", style: TextStyle(fontSize: 16)),
            Text("เลือกได้มากกว่า 1 ตัวเลือก", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.start,
          children: [
            FilterChip(label: Text("ซ่อมศูนย์"), onSelected: (selected) {}),
            FilterChip(label: Text("ซ่อมอู่"), onSelected: (selected) {}),
          ],
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: const Divider(height: 1),
    );
  }
}
