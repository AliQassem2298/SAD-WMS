// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/view/pages/dialog_page.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_drop_list.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpPageController>(
      init: SignUpPageController(),
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
                            'Create Your',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.offAllNamed(
                                WelcomePageController.id,
                              );
                            },
                            icon: const Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Account',
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
                              controller.firstName.text = value;
                            },
                            textEditingController: controller.firstName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your First Name',
                            text: 'First Name',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.lastName.text = value;
                            },
                            textEditingController: controller.lastName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Last Name',
                            text: 'Last Name',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.userName.text = value;
                            },
                            textEditingController: controller.userName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your User Name',
                            text: 'Username',
                            toggleVisibility: false,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.email.text = value;
                            },
                            textEditingController: controller.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field is empty';
                              }
                              if (!value.isEmail) {
                                return 'Enter valid email address';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Email',
                            text: 'Email',
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
                                return 'Field is empty';
                              }
                              if (value.length < 7) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Password',
                            text: 'Password',
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
                                return 'Field is empty';
                              }
                              if (controller.password.text !=
                                  controller.confirmPassword.text) {
                                return 'Passwords didn\'t match';
                              }
                              if (value.length < 7) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            hintText: 'Confirm Your Password',
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
                                    await controller.signUp(controller);
                                    print('Success');
                                    controller.loadingIndecatorFalse();
                                    Get.to(
                                      () => DialogPage(
                                        routeName: SignInPageController.id,
                                      ),
                                    );
                                  } catch (e) {
                                    print(e.toString());
                                    controller.showSnackBar(
                                      context,
                                      e.toString(),
                                    );
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'SIGN UP',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed(SignInPageController.id);
                                },
                                child: const Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
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
