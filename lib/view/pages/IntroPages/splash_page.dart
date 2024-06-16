import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/controller/splash_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/pages/on_bording_page.dart';
import 'package:warehouse_manegment_system/view/pages/welcome_page.dart';

class SplashPage extends StatelessWidget {
  final SplachPageController controller = Get.put(SplachPageController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 3),
      () {
        if (sharedPreferences!.getBool('firstTimer') == false) {
          if (sharedPreferences!.getString("token") == null)
            Get.offAll(() => WelcomePage());
          else {
            Get.offAllNamed(HomePageWithDrawerController.id);
          }
        } else {
          Get.offAll(() => OnBordingPage());
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/wms-logo-final.png',
          height: 500,
          width: 500,
        ),
      ),
    );
  }
}
