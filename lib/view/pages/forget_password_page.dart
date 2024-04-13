// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordPageController>(
      init: ForgetPasswordPageController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            body: Container(
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
                    padding:
                        const EdgeInsets.only(left: 25, top: 50, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Reset Password',
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
                          'Page',
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
                              horizontal: 25, vertical: 25),
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
                                if (!value.isEmail) {
                                  return 'enter a valid email address';
                                }
                                return null;
                              },
                              icon: IconButton(
                                icon: const Icon(Icons.done),
                                onPressed: () async {
                                  if (controller.formState.currentState!
                                      .validate()) {
                                    controller.loadingIndecatorTrue();
                                    try {
                                      await controller
                                          .forgetPasswordRequest(controller);
                                      controller.showSnackBar(
                                        context,
                                        'Password reset code sent to your email',
                                      );
                                      controller.codeVisible();
                                      controller.loadingIndecatorFalse();
                                    } catch (e) {
                                      print(e.toString());
                                      controller.showSnackBar(
                                        context,
                                        'Sorry, email not found in the database',
                                      );
                                    }
                                    controller.loadingIndecatorFalse();
                                  }
                                },
                              ),
                              text: 'Email',
                              hintText: 'Enter Your Email',
                              toggleVisibility: false,
                            ),
                            if (controller.isCodeVisible)
                              CustomTextFromField(
                                onChanged: (value) {
                                  controller.code.text = value;
                                },
                                textEditingController: controller.code,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'filed is empty';
                                  }
                                  return null;
                                },
                                text: 'Code',
                                hintText: 'Enter The Code',
                                toggleVisibility: false,
                              ),
                            if (controller.isCodeVisible)
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
                                text: 'Password',
                                hintText: 'Enter Your New Password',
                                toggleVisibility: false,
                              ),
                            if (controller.isCodeVisible)
                              CustomTextFromField(
                                onChanged: (value) {
                                  controller.confirmPassword.text = value;
                                },
                                textEditingController:
                                    controller.confirmPassword,
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
                                text: 'Confirm Password',
                                hintText: 'Confirm Your New Password',
                                toggleVisibility: false,
                              ),
                            // SlideTransition(
                            //   position: Tween<Offset>(
                            //     begin: const Offset(0, 5),
                            //     end: const Offset(0, 0),
                            //   ).animate(
                            //     CurvedAnimation(
                            //       parent: controller.animationController,
                            //       curve: const Interval(
                            //         0.6,
                            //         1.0,
                            //         curve: Curves.easeOut,
                            //       ),
                            //     ),
                            //   ),
                            //   child: ),
                            if (controller.isCodeVisible)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 25,
                                ),
                                child: CustomButton(
                                  text: 'Submit',
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Color(0xff2B1836),
                                      Color(0xff591C3C),
                                      Color(0xff911C3A),
                                      Color(0xffBB1636)
                                    ],
                                  ),
                                  onPressed: () async {
                                    if (controller.formState.currentState!
                                        .validate()) {
                                      controller.loadingIndecatorTrue();
                                      try {
                                        await controller
                                            .forgetPasswordConfirm(controller);

                                        controller.loadingIndecatorFalse();

                                        controller.showSnackBar(context,
                                            ' Password reset successful');
                                      } catch (e) {
                                        print(e.toString());
                                        controller.showSnackBar(
                                          context,
                                          'Invalid code',
                                        );
                                      }
                                      controller.loadingIndecatorFalse();
                                    }
                                  },
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
          ),
        );
      },
    );
  }
}
