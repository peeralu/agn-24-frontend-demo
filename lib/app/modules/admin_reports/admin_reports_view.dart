import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';

import 'admin_reports_controller.dart';

class AdminReportsView extends GetView<AdminReportsController> {
  const AdminReportsView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(
      child: Row(
        children: [
          Spacer(flex: 1),
          Expanded(flex: 10, child: ContentView()),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}

class ContentView extends GetView<AdminReportsController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
