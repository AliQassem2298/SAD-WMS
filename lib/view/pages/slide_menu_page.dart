import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/slide_menu_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_info_card.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_slide_menu.dart';

class SlideMenuPage extends StatelessWidget {
  const SlideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlideMenuController>(
      init: SlideMenuController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: kSecondtColor,
            width: 300,
            height: double.infinity,
            child: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomInfoCard(
                    name: 'Ali Qassem',
                    email: 'aliqassem@gmail.com',
                  ),
                  CustomSlideMenuTitle(),
                  IconButton(
                    onPressed: () {
                      sharedPreferences!.clear();
                      print("Shared preferanses cleared");
                      print(sharedPreferences!.getString("token"));
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(ProfilePageController.id);
                    },
                    // onPressed: () async {
                    //   try {
                    //     await Get.toNamed(ProfilePageController.id);
                    //   } catch (e) {
                    //     controller.showSnackBar(context, e.toString());
                    //   }

                    //   controller.loadingIndecatorTrue();
                    //   try {
                    //     await controller.logOut();
                    //     print('succsess');
                    //     controller.loadingIndecatorFalse();
                    //     // print('token=$token');

                    //     controller.showSnackBar(
                    //       context,
                    //       'Logout successful',
                    //     );
                    //     Get.offAllNamed(WelcomePageController.id);
                    //   } catch (e) {
                    //     print(e.toString());
                    //     controller.showSnackBar(
                    //       context,
                    //       e.toString(),
                    //     );
                    //   }
                    //   controller.loadingIndecatorFalse();
                    // },
                    icon: const Icon(Icons.supervised_user_circle_outlined),
                  ),
                  sharedPreferences!.getString("token") != null
                      ? Padding(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                      : IconButton(
                          onPressed: () {
                            Get.offAllNamed(WelcomePageController.id);
                            sharedPreferences!.clear();
                          },
                          icon: const Icon(Icons.backspace_outlined),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
