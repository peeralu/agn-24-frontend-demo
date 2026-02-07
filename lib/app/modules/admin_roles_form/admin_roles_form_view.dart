import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'admin_roles_form_controller.dart';

class AdminRolesFormView extends GetView<AdminRolesFormController> {
  const AdminRolesFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminRolesFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminRolesFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
