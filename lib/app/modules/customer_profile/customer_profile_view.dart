import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/modules/admin/widgets/content_body.dart';

import 'customer_profile_controller.dart';
import 'widgets/breadcrumb.dart';
import 'widgets/content.dart';

class CustomerProfileView extends GetView<CustomerProfileController> {
  const CustomerProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return ContentBodyWidget(title: "ข้อมูลส่วนตัวลูกค้า", breadcrumb: BreadcrumbPage(), child: ContentView());
  }
}
