// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
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
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/pages/home_page.dart';
import 'package:warehouse_manegment_system/view/pages/slide_menu_page.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_card.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_dialog.dart';

class HomePageWithDrawer extends StatefulWidget {
  HomePageWithDrawer({super.key});

  @override
  State<HomePageWithDrawer> createState() => _HomePageWithDrawerState();
}

class _HomePageWithDrawerState extends State<HomePageWithDrawer>
    with SingleTickerProviderStateMixin {
  // bool isDrawerOpen = false;
  bool isDrawerClose = true;
  bool isSideMenuClose = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(sharedPreferences!.getString("token"));

    return Scaffold(
      backgroundColor: kSecondtColor,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClose ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SlideMenuPage(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              // offset: Offset(isSideMenuClose ? 0 : 288, 0),
              offset: Offset(animation.value * 265, 0),

              child: Transform.scale(
                // scale: isSideMenuClose ? 1 : 0.85,
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  child: HomePage(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            curve: Curves.fastOutSlowIn,
            top: isDrawerClose ? 0 : 16,
            left: isDrawerClose ? 0 : 220,
            child: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 16, top: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      if (isDrawerClose) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                      setState(() {
                        isDrawerClose = !isDrawerClose;
                        isSideMenuClose = !isSideMenuClose;
                      });
                    },
                    child: isDrawerClose
                        ? Image.asset('assets/nwms.png')
                        : Icon(Icons.close),
                  )
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
                  ),
            ),
          )
        ],
      ),
    );

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
  }
}
