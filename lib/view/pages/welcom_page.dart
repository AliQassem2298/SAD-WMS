// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';

import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.centerRight,
        //         end: Alignment.centerLeft,
        //         colors: [
        //           Color(0xff2B1836),
        //           Color(0xff591C3C),
        //           Color(0xff911C3A),
        //           Color(0xffBB1636),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: GetBuilder<WelcomePageController>(
      init: WelcomePageController(),
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xff2B1836),
                Color(0xff591C3C),
                Color(0xff911C3A),
                Color(0xffBB1636),
              ],
            ),
          ),
          child: ListView(
            children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -5),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: controller.animationController,
                    curve: const Interval(
                      0.1,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/wms.png'),
                    // Icon(Icons.house_outlined),
                    const Center(
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SlideTransition(
                position: controller.slideAnimation1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                  child: CustomButton(
                    onPressed: () {
                      Get.toNamed(SignInPageController.id);
                    },
                    text: 'SIGN IN',
                    hasBorder: true,
                    borderColor: Colors.white,
                  ),
                ),
              ),
              SlideTransition(
                position: controller.slideAnimation2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: CustomButton(
                    onPressed: () {
                      Get.toNamed(SignUpPageController.id);
                    },
                    text: 'SIGN UP',
                    hasBorder: false,
                    gradient: const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 3),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: controller.animationController,
                    curve: const Interval(
                      0.6,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Continue with ',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(HomePageController.id);
                        },
                        child: const Text(
                          'Guest Mode',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        );
      },
    ));
  }
}
