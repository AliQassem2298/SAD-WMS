// ignore_for_file: avoid_print, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/update_user_details_controller.dart';
import 'package:warehouse_manegment_system/staff/model/models/user_model.dart';
import 'package:warehouse_manegment_system/staff/model/services/update_user_details_service.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_text_from_field.dart';

class UpdateUserDetailsPage extends StatelessWidget {
  UpdateUserDetailsPage({super.key});

  TextEditingController lastName = TextEditingController();

  TextEditingController firstNmae = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController email = TextEditingController();
  ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateUserDetailsController>(
      init: UpdateUserDetailsController(),
      builder: (controller) {
        controller.userModel =
            ModalRoute.of(context)!.settings.arguments as UserModel;
        controller.firstName.text = controller.userModel!.firstName;
        controller.lastName.text = controller.userModel!.lastName;
        controller.email.text = controller.userModel!.email;
        controller.userName.text = controller.userModel!.username;

        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            body: Stack(
              children: [
                Container(
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
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.w,
                    top: 10.h,
                    right: 6.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Update User',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Get.toNamed(ProfilePageController.id);
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Details Page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.w,
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
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.5.w,
                          vertical: 5.h,
                        ),
                        children: [
                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.firstName.text =
                                    controller.userModel!.firstName;
                              }
                              controller.firstName.text = value;
                            },
                            textEditingController: controller.firstName,
                            hintText: 'Enter Your First Name',
                            text: 'First Name',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),

                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.userModel!.lastName;
                              }
                              controller.lastName.text = value;
                            },
                            textEditingController: controller.lastName,
                            hintText: 'Enter Your Last Name',
                            text: 'Last Name',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),

                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.userName.text =
                                    controller.userModel!.username;
                              }
                              controller.userName.text = value;
                            },
                            textEditingController: controller.userName,
                            hintText: 'Enter Your User Name',
                            text: 'Username',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),

                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.email.text =
                                    controller.userModel!.email;
                              }
                              controller.email.text = value;
                            },
                            textEditingController: controller.email,
                            validator: (value) {
                              if (value!.isNotEmpty && !value.isEmail) {
                                return 'enter valid email address';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Email',
                            text: 'Email',
                            toggleVisibility: false,
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(right: 142, top: 10),
                          //   child:
                          // ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 5.h,
                            ),
                            child: CustomButton(
                              onPressed: () async {
                                if (controller.formState.currentState!
                                    .validate()) {
                                  controller.loadingIndecatorTrue();

                                  try {
                                    await UpdateUserDetailsService()
                                        .userUpdateDetails(
                                      firstName: controller.firstName.text == ""
                                          ? controller.userModel!.firstName
                                          : controller.firstName.text,
                                      lastName: controller.lastName.text == ""
                                          ? controller.userModel!.lastName
                                          : controller.lastName.text,
                                      userName: controller.userName.text == ""
                                          ? controller.userModel!.username
                                          : controller.userName.text,
                                      email: controller.email.text == ""
                                          ? controller.userModel!.email
                                          : controller.email.text,
                                    );
                                    profilePageController.up();
                                    // Get.toNamed(ProfilePageController.id);

                                    print('succsess');
                                    controller.loadingIndecatorFalse();
                                    controller.showSnackBar(
                                      context,
                                      'User Info Updated successfully',
                                    );
                                    Get.back();
                                  } catch (e) {
                                    print(e.toString());
                                    controller.showSnackBar(
                                      context,
                                      'At least one of the following fields is required: First Name, Last Name, Email, Username',
                                    );

                                    controller.loadingIndecatorFalse();
                                  }
                                }
                              },
                              text: 'Update',
                              hasBorder: true,
                              gradient: const LinearGradient(
                                colors: [
                                  // Color(0xff2B1836),
                                  // Color(0xff591C3C),
                                  // Color(0xff911C3A),
                                  // Color(0xffBB1636)
                                  kFirstColor,
                                  kFirstColor2,
                                ],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
