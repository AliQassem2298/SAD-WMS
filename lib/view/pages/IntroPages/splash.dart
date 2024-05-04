// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/pages/on_bording_page.dart';
import 'package:warehouse_manegment_system/view/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  static String id = '/SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // child: Padding(
          //   padding: const EdgeInsets.all(150.0),
          child: Image(
            image: AssetImage('assets/nwms.png'),
          ),
        ),
        // ),
      ),
    );
  }
}
