import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rive/rive.dart' as rive;

import 'package:frontend/app/core/service/flavor.dart';
import 'package:frontend/app/modules/widgets/widgets.dart';

import 'app/data/services/services.dart';

class AppInit {
  static Future<void> init() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..maskType = EasyLoadingMaskType.black
      ..indicatorSize = 45.0
      ..contentPadding = EdgeInsets.symmetric(horizontal: AppSize.xl, vertical: AppSize.lg)
      ..radius = AppSize.lg
      ..fontSize = 16
      ..userInteractions = false
      ..dismissOnTap = false;

    await rive.RiveNative.init();

    await dotenv.load(fileName: ".env");

    await FlavorService.init(flavor: Flavor.dev);

    await Jiffy.setLocale('th');

    await Database.init();

    await ModelRegistry.init();
    await AuthService.init();
    await ApiService.init(FlavorService.instance.baseUrl);
  }
}
