import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'agent_commission_controller.dart';

class AgentCommissionView extends GetView<AgentCommissionController> {
  const AgentCommissionView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "รายงานค่าคอมมิชชั่น", child: ContentView());
  }
}

class ContentView extends GetView<AgentCommissionController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🧭 Header
          Text("รายงานค่าคอมมิชชั่น", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // 💰 Summary cards
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _summaryCard(
                title: "รายได้รวมทั้งหมด",
                value: "฿ ${controller.totalCommission.value.toStringAsFixed(2)}",
                icon: Icons.paid_outlined,
                color: Colors.green,
              ),
              _summaryCard(
                title: "คอมมิชชั่นเดือนนี้",
                value: "฿ ${controller.currentMonth.value.toStringAsFixed(2)}",
                icon: Icons.trending_up_outlined,
                color: Colors.blueAccent,
              ),
            ],
          ),
          const SizedBox(height: 32),

          // 🔍 Filter bar
          Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  value: controller.selectedYear.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today_outlined),
                    hintText: "เลือกปี",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: ["2025", "2024", "2023"].map((y) => DropdownMenuItem(value: y, child: Text(y))).toList(),
                  onChanged: (v) => controller.selectedYear.value = v!,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category_outlined),
                    hintText: "ประเภทค่าคอม",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: const [
                    DropdownMenuItem(value: "health", child: Text("ประกันสุขภาพ")),
                    DropdownMenuItem(value: "accident", child: Text("อุบัติเหตุ")),
                    DropdownMenuItem(value: "car", child: Text("ประกันรถยนต์")),
                  ],
                  onChanged: (v) {
                    controller.typeFilter.value = v ?? "";
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // 📈 Chart section
          Text("แนวโน้มรายได้รายเดือน", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            padding: const EdgeInsets.all(16),
            child: LineChart(
              LineChartData(
                minY: 10,
                maxY: 20,
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (v, meta) =>
                          Text("${(v * 1000).toInt()}k", style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (v, meta) {
                        const months = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.'];
                        return Text(months[v.toInt() % months.length], style: const TextStyle(fontSize: 12));
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColors.accent,
                    barWidth: 3,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: true, color: AppColors.accent.withOpacity(0.1)),
                    spots: const [
                      FlSpot(0, 14.5),
                      FlSpot(1, 12.0),
                      FlSpot(2, 13.5),
                      FlSpot(3, 11.8),
                      FlSpot(4, 16.5),
                      FlSpot(5, 17.2),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // 📜 Table section
          Text("รายละเอียดค่าคอมมิชชั่น", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(AppColors.surface),
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text("เดือน")),
                DataColumn(label: Text("ยอดขายรวม")),
                DataColumn(label: Text("ค่าคอมมิชชั่น")),
                DataColumn(label: Text("สถานะ")),
              ],
              rows: controller.commissionData.map((d) {
                final isPaid = d.status == "จ่ายแล้ว";
                return DataRow(
                  cells: [
                    DataCell(Text(d.month)),
                    DataCell(Text("฿ ${d.sales.toStringAsFixed(0)}")),
                    DataCell(Text("฿ ${d.commission.toStringAsFixed(0)}")),
                    DataCell(
                      Chip(
                        label: Text(d.status),
                        backgroundColor: isPaid ? Colors.green.shade50 : Colors.orange.shade50,
                        labelStyle: TextStyle(
                          color: isPaid ? Colors.green.shade800 : Colors.orange.shade800,
                          fontWeight: FontWeight.w600,
                        ),
                        side: BorderSide(color: isPaid ? Colors.green.shade200 : Colors.orange.shade200),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }

  // ✅ Summary card reusable widget
  Widget _summaryCard({required String title, required String value, required IconData icon, required Color color}) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
