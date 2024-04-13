// ignore_for_file: library_private_types_in_public_api, must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';
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
                            'Hello',
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
                        'Sign In',
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
                              controller.email.text = value;
                            },
                            textEditingController: controller.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'filed is empty';
                              }

                              return null;
                            },
                            hintText: 'Enter Your Email Or User Name',
                            text: 'Email/UserName',
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
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        ForgetPasswordPageController.id);
                                  },
                                  child: const Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff2B1836),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 50),
                            child: CustomButton(
                              onPressed: () async {
                                if (controller.formState.currentState!
                                    .validate()) {
                                  controller.loadingIndecatorTrue();
                                  try {
                                    await controller.signIn(controller);
                                    print('succsess');
                                    controller.loadingIndecatorFalse();
                                    print('token=$token');
                                    controller.showSnackBar(
                                      context,
                                      'Sign in successful',
                                    );
                                    Get.toNamed(HomePageController.id);
                                  } catch (e) {
                                    print(e.toString());
                                    controller.showSnackBar(context,
                                        'Unable to log in with provided credentials.');
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'SIGN IN',
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
                              routeName: HomePageController.id,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Don\'t have an account?'),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(SignUpPageController.id);
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
