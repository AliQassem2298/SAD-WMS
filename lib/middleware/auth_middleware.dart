// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';

class AuthMiddleare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getString("token") != null)
      return RouteSettings(name: HomePageController.id);
  }
}
