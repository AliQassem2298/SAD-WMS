import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/drawer_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_info_card.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_slide_menu.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerPageController>(
      init: DrawerPageController(),
      builder: (controller) {
        print(sharedPreferences!.getString("token"));

        print(sharedPreferences!.getString("firstName"));
        print(sharedPreferences!.getString("lastName"));
        print(sharedPreferences!.getString("email"));

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  kFirstColor,
                  kFirstColor2,

                  // kSecondtColor,
                  // kThierdColor,

                  // kFourthColor,
                ],
              ),
            ),
            width: 300,
            height: double.infinity,
            child: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  sharedPreferences!.getString("token") != null
                      ? CustomInfoCard(
                          firstName:
                              sharedPreferences!.getString("firstName") ?? '',
                          lastName:
                              sharedPreferences!.getString("lastName") ?? '',
                          email: sharedPreferences!.getString("email") ?? '',
                        )
                      : Container(),
                  sharedPreferences!.getString("token") != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Divider(
                            color: Colors.white24,
                            height: 1,
                          ),
                        )
                      : Container(),
                  CustomSlideMenuTitle(
                    icon: Icons.person,
                    text: 'profile',
                    ontap: () {
                      Get.toNamed(ProfilePageController.id);
                    },
                  ),
                  sharedPreferences!.getString("token") != null
                      ? CustomSlideMenuTitle(
                          icon: Icons.logout,
                          text: 'logout',
                          ontap: () async {
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
                                'Logged out successfully.',
                              );
                              Get.offAllNamed(WelcomePageController.id);
                            } catch (e) {
                              print(e.toString());
                              controller.showSnackBar(
                                context, e.toString(),
                                // ' Authentication credentials were not provided.',
                              );
                            }

                            controller.loadingIndecatorFalse();
                          },
                        )
                      : CustomSlideMenuTitle(
                          icon: Icons.backspace_outlined,
                          ontap: () {
                            Get.offAllNamed(WelcomePageController.id);
                            sharedPreferences!.clear();
                          },
                          text: 'Back',
                        ),
                  //  IconButton(
                  //     onPressed: () {
                  //       Get.offAllNamed(WelcomePageController.id);
                  //       sharedPreferences!.clear();
                  //     },
                  //     icon: const Icon(
                  //       Icons.backspace_outlined,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  IconButton(
                    onPressed: () {
                      sharedPreferences!.clear();
                      print("Shared preferanses cleared");
                      print(sharedPreferences!.getString("token"));
                    },
                    icon: Icon(Icons.delete),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   // onPressed: () async {
                  //   //   try {
                  //   //     await Get.toNamed(ProfilePageController.id);
                  //   //   } catch (e) {
                  //   //     controller.showSnackBar(context, e.toString());
                  //   //   }
                  //   //   controller.loadingIndecatorTrue();
                  //   //   try {
                  //   //     await controller.logOut();
                  //   //     print('succsess');
                  //   //     controller.loadingIndecatorFalse();
                  //   //     // print('token=$token');
                  //   //     controller.showSnackBar(
                  //   //       context,
                  //   //       'Logout successful',
                  //   //     );
                  //   //     Get.offAllNamed(WelcomePageController.id);
                  //   //   } catch (e) {
                  //   //     print(e.toString());
                  //   //     controller.showSnackBar(
                  //   //       context,
                  //   //       e.toString(),
                  //   //     );
                  //   //   }
                  //   //   controller.loadingIndecatorFalse();
                  //   // },
                  //   icon: const Icon(Icons.supervised_user_circle_outlined),
                  // ),
                  // ? Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 50),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Color(0xff9b9ca3),
                  //         borderRadius: BorderRadius.circular(
                  //           35,
                  //         ),
                  //       ),
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 50,
                  //         vertical: 12,
                  //       ),
                  //       child: InkWell(
                  //         onTap: () async {
                  //           controller.loadingIndecatorTrue();
                  //           try {
                  //             await controller.logOut();
                  //             sharedPreferences!.clear();
                  //             // userId = null;
                  //             print('succsess');
                  //             controller.loadingIndecatorFalse();
                  //             // print('token=$token');
                  //             // userToken = null;

                  //             controller.showSnackBar(
                  //               context,
                  //               'Logout successful',
                  //             );
                  //             Get.offAllNamed(WelcomePageController.id);
                  //           } catch (e) {
                  //             print(e.toString());
                  //             controller.showSnackBar(
                  //               context, e.toString(),
                  //               // ' Authentication credentials were not provided.',
                  //             );
                  //           }
                  //           controller.loadingIndecatorFalse();
                  //         },
                  //         child: Row(
                  //           mainAxisAlignment:
                  //               MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             Text(
                  //               "Logout",
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //             Icon(
                  //               Icons.logout,
                  //               color: Color(0xff2d77c1),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  // : IconButton(
                  //     onPressed: () {
                  //       Get.offAllNamed(WelcomePageController.id);
                  //       sharedPreferences!.clear();
                  //     },
                  //     icon: const Icon(Icons.backspace_outlined),
                  //   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
