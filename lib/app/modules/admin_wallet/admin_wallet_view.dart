import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'admin_wallet_controller.dart';

class AdminWalletView extends GetView<AdminWalletController> {
  const AdminWalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminWalletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminWalletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
