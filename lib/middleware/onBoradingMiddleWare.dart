// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';

class onBoradingMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getBool('firstTimer') == null) {
      sharedPreferences!.setBool('firstTimer', true);
    }
    if (sharedPreferences!.getBool('firstTimer') == false) {
      if (sharedPreferences!.getString("token") == null) {
        // return RouteSettings(name: '/login');
        return RouteSettings(name: WelcomePageController.id);
      } else {
        // return RouteSettings(name: '/home');
        return RouteSettings(name: HomePageWithDrawerController.id);
      }
    }
  }
}
