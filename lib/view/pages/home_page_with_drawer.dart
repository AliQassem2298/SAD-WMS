// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

// import 'package:get/get.dart';

// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/inventory_scan_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/stocktaking_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/transfer_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_card.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_dialog.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/pages/home_page.dart';
import 'package:warehouse_manegment_system/view/pages/drawer_page.dart';

class HomePageWithDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);

    return GetBuilder<HomePageWithDrawerController>(
      init: HomePageWithDrawerController(),
      builder: (controller) {
        print(sharedPreferences!.getString("token"));

        return Scaffold(
          backgroundColor: kFirstColor2,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.fastOutSlowIn,
                    width: 0.7 * ScreenSizeConfig.screenWidth,
                    left: controller.isSideMenuClose.value
                        ? -0.7 * ScreenSizeConfig.screenWidth
                        : 0,
                    height: ScreenSizeConfig.screenHeight,
                    child: DrawerPage(),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(controller.animation.value -
                          30 * controller.animation.value * pi / 180),
                    child: Transform.translate(
                      offset: Offset(
                          controller.animation.value *
                              0.63 *
                              ScreenSizeConfig.screenWidth,
                          0),
                      child: Transform.scale(
                        scale: controller.scaleAnimation.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                controller.isDrawerClose.value ? 0 : 10.w),
                          ),
                          child: HomePage(),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.fastOutSlowIn,
                    top: controller.isDrawerClose.value ? -2.5.h : 3.h,
                    left: controller.isDrawerClose.value
                        ? 0
                        : 0.5 * ScreenSizeConfig.screenWidth,
                    child: SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 5.w,
                        ),
                        height: 12.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8.w,
                              offset: Offset(0, 3.h),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () => controller.toggleDrawer(),
                          child: controller.isDrawerClose.value
                              ? Image.asset('assets/wms-logo-final.png')
                              : Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
    // child: isDrawerClose
    //     ? IconButton(
    //         onPressed: () {
    //           if (isDrawerClose) {
    //             _animationController.forward();
    //           } else {
    //             _animationController.reverse();
    //           }
    //           setState(() {
    //             isDrawerClose = !isDrawerClose;
    //             isSideMenuClose = !isSideMenuClose;
    //           });
    //         },
    //         icon: Icon(Icons.menu),
    //       )
    //     : IconButton(
    //         onPressed: () {
    //           if (isDrawerClose) {
    //             _animationController.forward();
    //           } else {
    //             _animationController.reverse();
    //           }
    //           setState(() {
    //             isDrawerClose = !isDrawerClose;
    //             isSideMenuClose = !isSideMenuClose;
    //           });
    //         },
    //         icon: Icon(Icons.close),
    //       ),

    /*
           Blue
          2d77c1
          Dark blue
          35626e
          Dark Gray
          9b9ca3
          Light Gray
          d9dadb 
           */

