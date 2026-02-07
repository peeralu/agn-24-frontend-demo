import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/admin_controller.dart';
import 'package:frontend/app/modules/widgets/app_space.dart';
import 'package:frontend/app/routes/app_pages.dart';
import 'package:frontend/theme.dart';

class SideNav extends GetView<AdminController> {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 260,
      height: double.infinity,
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.asset('images/logo.png', width: 100, height: 100),
              ),
            ),
          ),

          AppSpace.vertical.m,

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: AppColors.white.withValues(alpha: 0.15)),
                  _sectionTitle("เมนูหลัก"),
                  // _navItem(Icons.login, "หน้า Public / Login", Routes.LOGIN),

                  // _sectionTitle("CUSTOMER PORTAL"),
                  _expandableMenu(
                    icon: Icons.person_outline,
                    title: "ระบบลูกค้า",
                    routes: {"ข้อมูลลูกค้า": Routes.CUSTOMER_LIST},
                  ),

                  // _sectionTitle("AGENT PORTAL"),
                  _expandableMenu(
                    icon: Icons.badge_outlined,
                    title: "ระบบตัวแทน",
                    routes: {
                      "แดชบอร์ด": Routes.AGENT_DASHBOARD,
                      "ข้อมูลส่วนตัว": Routes.AGENT_PROFILE,
                      "ลูกค้า": Routes.AGENT_CUSTOMERS,
                      "ค้นหาประกัน": Routes.AGENT_INSURANCE_SEARCH,
                      "เติมเงิน": Routes.AGENT_TOPUP,
                      "ค่าคอมมิชชั่น": Routes.AGENT_COMMISSION,
                      "สมัครตัวแทน": Routes.AGENT_REGISTER,
                    },
                  ),

                  // _sectionTitle("INSURANCE"),
                  _expandableMenu(
                    icon: Icons.search_outlined,
                    title: "ค้นหา/สมัครประกัน",
                    routes: {
                      "ค้นหาประกัน": Routes.INSURANCE_SEARCH,
                      // "รายละเอียด": Routes.INSURANCE_DETAIL,
                      // "สมัครประกัน": Routes.INSURANCE_ENROLL,
                    },
                  ),

                  // _sectionTitle("WALLET"),
                  _expandableMenu(
                    icon: Icons.account_balance_wallet_outlined,
                    title: "ระบบเติมเงิน",
                    routes: {
                      // "ยอดเงินคงเหลือ": Routes.WALLET_BALANCE,
                      "เติมเงิน": Routes.WALLET_TOPUP,
                      // "ประวัติธุรกรรม": Routes.WALLET_HISTORY,
                    },
                  ),

                  SizedBox(height: 16),
                  _sectionTitle("เมนูแอดมิน"),
                  _expandableMenu(
                    icon: Icons.bar_chart_outlined,
                    title: "ระบบรายงาน",
                    routes: {
                      "ยอดขาย": Routes.REPORT_SALES,
                      "ค่าคอมมิชชั่น": Routes.REPORT_COMMISSION,
                      "ยอดเติมเงิน": Routes.REPORT_TOPUP,
                      "รายงานตัวแทน": Routes.REPORT_AGENTS,
                      "รายงานลูกค้า": Routes.REPORT_CUSTOMERS,
                    },
                  ),

                  _expandableMenu(
                    icon: Icons.admin_panel_settings_outlined,
                    title: "ระบบแอดมิน",
                    routes: {
                      "จัดการตัวแทน": Routes.ADMIN_AGENTS,
                      "จัดการลูกค้า": Routes.ADMIN_CUSTOMERS,
                      "จัดการประกัน": Routes.ADMIN_INSURANCE,
                      "จัดการผู้ใช้": Routes.ADMIN_USERS,
                    },
                  ),
                ],
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: controller.onSignOut,
              hoverColor: Colors.white.withValues(alpha: 0.15),
              splashColor: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    const Text(
                      "ออกจากระบบ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(color: AppColors.white.withValues(alpha: 0.15)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("v1.0.0", style: theme.textTheme.bodySmall?.copyWith(color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w900, letterSpacing: 0.5),
      ),
    );
  }

  Widget _navItem(bool isAnyChildActive, String title, String route) {
    return Obx(() {
      final isActive = controller.currentPage.value == route;
      var color = Colors.transparent;
      // if (isAnyChildActive) {
      //   color = AppColors.white.withValues(alpha: 0.2);
      // }
      return Container(
        color: color,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => controller.changePage(route),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_right_rounded,
                        color: isActive ? AppColors.white : AppColors.white.withValues(alpha: 0.7),
                        size: 20,
                      ),
                      AppSpace.horizontal.xl,
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            color: isActive ? AppColors.white : AppColors.white.withValues(alpha: 0.5),
                            fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _expandableMenu({required IconData icon, required String title, required Map<String, String> routes}) {
    final expanded = false.obs;
    return Obx(() {
      final isAnyChildActive = routes.values.contains(controller.currentPage.value);

      if (isAnyChildActive && expanded.value == false) {
        expanded.value = true;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () => expanded.value = !expanded.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                // color: isAnyChildActive ? AppColors.white.withValues(alpha: 0.4) : Colors.transparent,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: isAnyChildActive ? AppColors.white : AppColors.white.withValues(alpha: 0.5),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: isAnyChildActive ? AppColors.white : AppColors.white.withValues(alpha: 0.5),
                          fontSize: 16,
                          fontWeight: isAnyChildActive ? FontWeight.bold : FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    Icon(
                      expanded.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                      size: 20,
                      color: Colors.white54,
                    ),
                  ],
                ),
              ),
            ),
          ),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Column(children: routes.entries.map((e) => _navItem(isAnyChildActive, e.key, e.value)).toList()),
            ),
            crossFadeState: expanded.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          ),
        ],
      );
    });
  }
}
