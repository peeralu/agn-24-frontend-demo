import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'admin_roles_controller.dart';

class AdminRolesView extends GetView<AdminRolesController> {
  const AdminRolesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminRolesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminRolesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
