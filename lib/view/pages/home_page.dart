// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_card.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
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
          child: Scaffold(
            // backgroundColor: Color(0xffd9dadb),
            // backgroundColor: Colors.white,

            drawer: Drawer(
              backgroundColor: Color(0xffd9dadb),
              child: ListView(
                children: [
                  IconButton(
                    onPressed: () {
                      sharedPreferences!.clear();
                      print("Shared preferanses cleared");
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () async {
                      try {
                        await Get.toNamed(ProfilePageController.id);
                      } catch (e) {
                        controller.showSnackBar(context, e.toString());
                      }

                      // controller.loadingIndecatorTrue();
                      // try {
                      //   await controller.logOut();
                      //   print('succsess');
                      //   controller.loadingIndecatorFalse();
                      //   print('token=$token');

                      //   controller.showSnackBar(
                      //     context,
                      //     'Logout successful',
                      //   );
                      //   Get.offAllNamed(WelcomePageController.id);
                      // } catch (e) {
                      //   print(e.toString());
                      //   controller.showSnackBar(
                      //     context,
                      //     e.toString(),
                      //   );
                      // }
                      // controller.loadingIndecatorFalse();
                    },
                    icon: const Icon(Icons.supervised_user_circle_outlined),
                  ),
                  // sharedPreferences!.getString("token") != null
                  // ?
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 50),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Color(0xff9b9ca3),
                  //       borderRadius: BorderRadius.circular(
                  //         35,
                  //       ),
                  //     ),
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: 50,
                  //       vertical: 12,
                  //     ),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         controller.loadingIndecatorTrue();
                  //         try {
                  //           await controller.logOut();
                  //           sharedPreferences!.clear();
                  //           // userId = null;
                  //           print('succsess');
                  //           controller.loadingIndecatorFalse();
                  //           // print('token=$token');
                  //           // userToken = null;

                  //           controller.showSnackBar(
                  //             context,
                  //             'Logout successful',
                  //           );
                  //           // Get.offAllNamed(WelcomePageController.id);
                  //         } catch (e) {
                  //           print(e.toString());
                  //           controller.showSnackBar(
                  //             context, e.toString(),
                  //             // ' Authentication credentials were not provided.',
                  //           );
                  //         }
                  //         controller.loadingIndecatorFalse();
                  //       },
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Text(
                  //             "Logout",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           Icon(
                  //             Icons.logout,
                  //             color: Color(0xff2d77c1),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                  // // : IconButton(
                  //     onPressed: () {
                  //       Get.offAllNamed(WelcomePageController.id);
                  //       sharedPreferences!.clear();
                  //     },
                  //     icon: const Icon(Icons.backspace_outlined),
                  //   )
                  // ,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 16,
                    ),
                    child: CustomButton(
                      hasBorder: false,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff9b9ca3),
                          Color(0xff9b9ca3),
                        ],
                      ),
                      onPressed: () {
                        //   controller.loadingIndecatorTrue();

                        //   controller.loadingIndecatorFalse();
                        Get.to(
                          () => MyDialog(
                            dialogTitle: 'Delete Account',
                            hintText: 'Enter your password',
                          ),
                        );
                      },
                      text: 'Delete Account',
                      textColor: const Color(0xffBB1636),
                      // hasBorder: true,
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff9b9ca3),
                      borderRadius: BorderRadius.circular(
                        35,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 12,
                    ),
                    child: InkWell(
                      onTap: () async {
                        controller.loadingIndecatorTrue();
                        try {
                          await controller.logOut();
                          sharedPreferences!.clear();
                          // userId = null;
                          print('succsess');
                          controller.loadingIndecatorFalse();
                          // print('token=$token');
                          // userToken = null;

                          controller.showSnackBar(
                            context,
                            'Logout successful',
                          );
                          // Get.offAllNamed(WelcomePageController.id);
                        } catch (e) {
                          print(e.toString());
                          controller.showSnackBar(
                            context, e.toString(),
                            // ' Authentication credentials were not provided.',
                          );
                        }
                        controller.loadingIndecatorFalse();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.logout,
                            color: Color(0xff2d77c1),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
              // backgroundColor: Color(0xffd9dadb),
              // title: Text('Warehouse management system'),
              title: Text('WMS'),
              centerTitle: true,

              leading: Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Image.asset(
                      'assets/nwms.png',
                    ),
                  );
                },
              ),
              automaticallyImplyLeading: false,
            ),
            body: sharedPreferences!.getString("role") == "staff"
                ? GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    children: [
                      CustomCard(
                        text: "Shippments",
                      ),
                      CustomCard(
                        text: "asdads",
                      ),
                    ],
                  )
                : sharedPreferences!.getString("role") == "customer"
                    ? Center(
                        child: Text(
                          'Welcome Customer',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Welcome Geust',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
          ),
        );
      },
    );
  }
}
