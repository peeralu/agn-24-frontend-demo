import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/admin_controller.dart';

import 'widgets/header_bar.dart';
import 'widgets/side_nav.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideNav(), // ด้านซ้าย
          Expanded(
            child: Column(
              children: [
                const HeaderBar(),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    padding: const EdgeInsets.all(20),
                    child: Obx(() {
                      final route = controller.currentPage.value;
                      switch (route) {
                        case '/admin/media':
                          return const Center(child: Text("📸 Media Management"));
                        case '/admin/users':
                          return const Center(child: Text("👤 User Management"));
                        default:
                          return const Center(child: Text("📊 Dashboard Overview"));
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
