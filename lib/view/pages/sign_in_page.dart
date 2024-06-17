// ignore_for_file: library_private_types_in_public_api, must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInPageController>(
      init: SignInPageController(),
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
                            'Hello',
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
                        'Sign In',
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
                              controller.email.text = value;
                            },
                            textEditingController: controller.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Email Or User Name',
                            text: 'Email/Username',
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
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      ForgetPasswordPageController.id,
                                    );
                                  },
                                  child: const Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: kFirstColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                    await controller.signIn(controller);
                                    print('Success');
                                    controller.loadingIndecatorFalse();
                                    Get.snackbar(
                                      'Hi',
                                      'Sign in successful',
                                    );
                                    Get.toNamed(
                                      HomePageWithDrawerController.id,
                                    );
                                  } catch (e) {
                                    print(e.toString());
                                    Get.snackbar(
                                      'Sorry',
                                      e.toString(),
                                      colorText: Colors.white,
                                    );
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'SIGN IN',
                              hasBorder: true,
                              gradient: const LinearGradient(
                                colors: [
                                  kFirstColor,
                                  kFirstColor2,
                                ],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight,
                              ),
                              routeName: HomePageWithDrawerController.id,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Don\'t have an account?'),
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed(SignUpPageController.id);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
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
