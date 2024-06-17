// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';

import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);

    return Scaffold(
      body: GetBuilder<WelcomePageController>(
        init: WelcomePageController(),
        builder: (controller) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  kFirstColor,
                  kFirstColor2,
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
                      Image.asset(
                        'assets/wms-white-new.png',
                        width: 100.w,
                        height: 100.w,
                      ),
                      Center(
                        child: Text(
                          'Welcome Back ...',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 4.h,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 3.h,
                    ),
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed(SignInPageController.id);
                      },
                      text: 'SIGN IN',
                      textColor: kWhiteColor,
                      hasBorder: true,
                      borderColor: kWhiteColor,
                    ),
                  ),
                ),
                SlideTransition(
                  position: controller.slideAnimation2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed(SignUpPageController.id);
                      },
                      text: 'SIGN UP',
                      hasBorder: false,
                      gradient: const LinearGradient(
                        colors: [
                          kWhiteColor,
                          kWhiteColor,
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
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with ',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 2.h,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(HomePageWithDrawerController.id);
                          },
                          child: Text(
                            'Guest Mode',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 2.5.h,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
