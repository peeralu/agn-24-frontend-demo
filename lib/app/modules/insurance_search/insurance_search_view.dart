import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';

import 'insurance_search_controller.dart';
import 'widget/Insurance_filter.dart';

class InsuranceSearchView extends GetView<InsuranceSearchController> {
  const InsuranceSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ค้นหาแผนประกัน", child: ContentView());
  }
}

class ContentView extends GetView<InsuranceSearchController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: InsuranceFilter()),
        const SizedBox(width: 16),
        Expanded(flex: 10, child: Container()),
      ],
    );
  }
}
