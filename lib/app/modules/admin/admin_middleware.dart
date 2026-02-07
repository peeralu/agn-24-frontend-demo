import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:frontend/app/routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    try {
      // final session = Supabase.instance.client.auth.currentSession;
      // if (session == null) {
      //   return const RouteSettings(name: Routes.LOGIN);
      // }
    } catch (e) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}

class AdminMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    try {
      // final session = Supabase.instance.client.auth.currentSession;
      // if (session == null) {
      //   return const RouteSettings(name: Routes.LOGIN);
      // }

      // final user = Supabase.instance.client.auth.currentUser;
      // final role = (user?.role ?? '').toLowerCase();
      // if (user == null || (role != 'admin' && role != 'super admin')) {
      //   return const RouteSettings(name: Routes.LOGIN);
      // }
    } catch (e) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
