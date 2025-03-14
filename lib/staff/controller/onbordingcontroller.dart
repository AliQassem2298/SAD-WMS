// ignore_for_file: body_might_complete_normally_nullable

// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/welcome_page_controller.dart';
// import 'package:warehouse_manegment_system/main.dart';

class OnBordingController extends GetxController {
  static String id = '/OnBordingController';
  RxBool isLast = false.obs;
  RxBool firstTimer = true.obs;

  void changeIndex(index) {
    isLast.value = (index == 3);
  }

  switchFirsTimer() async {
    firstTimer.value = false;
    print(firstTimer.value);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('firstTimer', firstTimer.value);
    // Get.offNamed('/login');
    Get.offNamed(WelcomePageController.id);
  }
}
