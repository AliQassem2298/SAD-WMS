import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constans.dart';

class ScreenSizeMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    ScreenSizeConfig.init(Get.context!);
    return null;
  }
}
