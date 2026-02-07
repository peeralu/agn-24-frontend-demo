import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import 'package:frontend/init.dart';
import 'package:frontend/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await AppInit.init();
  runApp(
    ToastificationWrapper(
      child: GetMaterialApp(
        title: "AGN24",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: appTheme,
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
