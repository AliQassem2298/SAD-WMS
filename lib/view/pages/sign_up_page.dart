// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/view/pages/dialog_page.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_drop_list.dart';
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
                            'Create Your',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
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
                      const Text(
                        'Account',
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
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25),
                        children: [
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.firstName.text = value;
                            },
                            textEditingController: controller.firstName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your First Name',
                            text: 'First Name',
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.lastName.text = value;
                            },
                            textEditingController: controller.lastName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }

                              return null;
                            },
                            hintText: 'Enter Your Last Name',
                            text: 'Last Name',
                            // keyboardType: TextInputType.text,
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.userName.text = value;
                            },
                            textEditingController: controller.userName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }
                              return null;
                            },
                            hintText: 'Enter Your User Name',
                            text: 'Username',
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.email.text = value;
                            },
                            textEditingController: controller.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }
                              if (!value.isEmail) {
                                return 'enter valid email address';
                              }
                              return null;
                            },
                            hintText: 'Enter Your Email',
                            text: 'Email',
                            toggleVisibility: false,
                          ),
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
                            hintText: 'Enter Your Password',
                            text: 'Password',
                            icon: const Icon(Icons.remove_red_eye),
                            toggleVisibility: true,
                          ),
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
                            hintText: 'Enter Your Password',
                            text: 'Confirm Password',
                            icon: const Icon(Icons.remove_red_eye),
                            toggleVisibility: true,
                          ),
                          CustomDropList(
                            textEditingController: controller.role,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select an option';
                              }
                              return null;
                            },
                            option1: 'customer',
                            option2: 'staff',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 25,
                            ),
                            child: CustomButton(
                              onPressed: () async {
                                if (controller.formState.currentState!
                                    .validate()) {
                                  controller.loadingIndecatorTrue();

                                  try {
                                    await controller.signUp(controller);

                                    print('succsess');
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
                                      'A user with that username or email is already exists.',
                                    );
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'SIGN UP',
                              hasBorder: true,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
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
