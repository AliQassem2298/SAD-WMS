// ignore_for_file: library_private_types_in_public_api, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';
import 'package:warehouse_manegment_system/model/services/get_user_details__by_id_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfilePageController>(
        init: ProfilePageController(),
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
                  Color(0xffBB1636)
                ],
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xff2B1836),
                        Color(0xff591C3C),
                        Color(0xff911C3A),
                        Color(0xffBB1636)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Profile Page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    height: controller.containerHeight,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                      color: Colors.white,
                    ),
                    child: FutureBuilder<UserModel>(
                      future: userId != null
                          ? GetUserDetailsByIdService()
                              .getUserDetailsById(id: userId!)
                          : Future.error(
                              'You are gest 😒😅 \n you don\'t have an account',
                            ),
                      builder: (context, snapshot) {
                        try {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            UserModel userModel = snapshot.data!;
                            return ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 25,
                              ),
                              children: [
                                CustomRow(
                                  text: userModel.firstName,
                                  hintText: 'Enter Your First Name',
                                  userModel: userModel,
                                ),
                                CustomRow(
                                  text: userModel.lastName,
                                  hintText: 'Enter Your Last Name',
                                  userModel: userModel,
                                ),
                                CustomRow(
                                  text: userModel.email,
                                  hintText: 'Enter Email',
                                  userModel: userModel,
                                ),
                                CustomRow(
                                  text: userModel.username,
                                  hintText: 'Enter User Name',
                                  userModel: userModel,
                                ),
                                CustomRow(
                                  text: userModel.role,
                                  hintText: 'Enter Your Role',
                                  userModel: userModel,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 25),
                                  child: CustomButton(
                                    routeName: WelcomePageController.id,
                                    text: 'Delete Account',
                                    hasBorder: true,
                                    borderColor: Colors.white,
                                    textColor: Colors.white,
                                    dialogTitle: 'Account Deleted',
                                    dialogContent: 'Successfully',
                                    dialogButtonText: 'OK',
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff2B1836),
                                        Color(0xff591C3C),
                                        Color(0xff911C3A),
                                        Color(0xffBB1636)
                                      ],
                                      end: Alignment.topLeft,
                                      begin: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text('No data available'),
                            );
                          }
                        } catch (e) {
                          // Handle any other errors
                          print('Error: $e');
                          return const Center(
                            child: Text(
                                'An error occurred. Please try again later.'),
                          );
                        }
                      },
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
