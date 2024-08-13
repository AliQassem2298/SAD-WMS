// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/change_password_page_controller.dart';
import 'package:warehouse_manegment_system/staff/model/services/change_password_service.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_text_from_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordPageController>(
      init: ChangePasswordPageController(),
      builder: (controller) {
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
                        // Color(0xff2B1836),
                        // Color(0xff591C3C),
                        // Color(0xff911C3A),
                        // Color(0xffBB1636)
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
                            'Change',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.w,
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
                      Text(
                        'Password Page',
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
                              controller.oldPassword.text = value;
                            },
                            textEditingController: controller.oldPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }

                              return null;
                            },
                            hintText: 'Enter Your Old Password',
                            text: ' Old Password',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.password.text = value;
                            },
                            textEditingController: controller.password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your New Password',
                            text: 'New Password',
                            icon: const Icon(Icons.remove_red_eye),
                            toggleVisibility: true,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.confirmPassword.text = value;
                            },
                            textEditingController: controller.confirmPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }
                              if (controller.password.value !=
                                  controller.confirmPassword.value) {
                                return 'password didn\'t match';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Confirm New Password',
                            text: 'Confirm Password',
                            icon: const Icon(Icons.remove_red_eye),
                            toggleVisibility: true,
                          ),
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
                                    await ChangePasswordService()
                                        .changePassword(
                                      oldPassword: controller.oldPassword.text,
                                      password: controller.password.text,
                                      confirmPassword:
                                          controller.confirmPassword.text,
                                    );
                                    print('succsess');
                                    controller.loadingIndecatorFalse();

                                    controller.showSnackBar(
                                      context,
                                      'Password changed successfully',
                                    );
                                  } catch (e) {
                                    print(e.toString());
                                    controller.showSnackBar(
                                      context,
                                      'Old password is incorrect',
                                    );
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'Update Password',
                              hasBorder: true,
                              gradient: const LinearGradient(
                                colors: [
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
