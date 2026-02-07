import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';

import 'report_commission_controller.dart';

class ReportCommissionView extends GetView<ReportCommissionController> {
  const ReportCommissionView({super.key});
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

class ContentView extends GetView<ReportCommissionController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
