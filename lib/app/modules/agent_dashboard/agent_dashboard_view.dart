import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';
import 'package:frontend/theme.dart';

import 'agent_dashboard_controller.dart';

class AgentDashboardView extends GetView<AgentDashboardController> {
  const AgentDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "แดชบอร์ดตัวแทน", child: ContentView());
  }
}

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "อัปเดตล่าสุด: 8 พ.ย. 2025",
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 🔸 Summary Cards
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _summaryCard(
                icon: Icons.account_balance_wallet_outlined,
                title: "ยอดคอมมิชชั่นรวม",
                value: "฿ 124,500",
                color: Colors.green,
              ),
              _summaryCard(
                icon: Icons.people_alt_outlined,
                title: "จำนวนลูกค้า",
                value: "245 คน",
                color: Colors.blueAccent,
              ),
              _summaryCard(
                icon: Icons.receipt_long_outlined,
                title: "ยอดขายรวม",
                value: "฿ 1,245,000",
                color: Colors.orange,
              ),
              _summaryCard(
                icon: Icons.trending_up_outlined,
                title: "เติมเงินเดือนนี้",
                value: "฿ 18,000",
                color: Colors.purple,
              ),
            ],
          ),

          const SizedBox(height: 32),

          // 🔹 Sales Chart Section
          Text("ยอดขายรายเดือน", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            padding: const EdgeInsets.all(16),
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'ม.ค.',
                          'ก.พ.',
                          'มี.ค.',
                          'เม.ย.',
                          'พ.ค.',
                          'มิ.ย.',
                          'ก.ค.',
                          'ส.ค.',
                          'ก.ย.',
                          'ต.ค.',
                          'พ.ย.',
                          'ธ.ค.',
                        ];
                        return Text(months[value.toInt() % 12], style: const TextStyle(fontSize: 12));
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (v, meta) => Text("${v.toInt()}k", style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColors.accent,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: true, color: AppColors.accent.withValues(alpha: 0.1)),
                    spots: const [
                      FlSpot(0, 12),
                      FlSpot(1, 14),
                      FlSpot(2, 18),
                      FlSpot(3, 13),
                      FlSpot(4, 20),
                      FlSpot(5, 17),
                      FlSpot(6, 24),
                      FlSpot(7, 22),
                      FlSpot(8, 19),
                      FlSpot(9, 23),
                      FlSpot(10, 25),
                      FlSpot(11, 28),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // 🔹 Recent Transactions
          Text("รายการล่าสุด", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Column(
              children: [
                _transactionRow(
                  title: "ลูกค้าใหม่สมัครประกัน",
                  date: "8 พ.ย. 2025",
                  amount: "+฿ 2,400",
                  color: Colors.green,
                ),
                _transactionRow(title: "เติมเงินเข้าระบบ", date: "6 พ.ย. 2025", amount: "-฿ 500", color: Colors.orange),
                _transactionRow(
                  title: "รับค่าคอมมิชชั่นประจำเดือน",
                  date: "1 พ.ย. 2025",
                  amount: "+฿ 12,000",
                  color: Colors.blue,
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }

  // ✅ Summary Card Widget
  Widget _summaryCard({required IconData icon, required String title, required String value, required Color color}) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
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

  // ✅ Transaction Row Widget
  Widget _transactionRow({required String title, required String date, required String amount, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 0.8)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: color),
          ),
        ],
      ),
    );
  }
}
