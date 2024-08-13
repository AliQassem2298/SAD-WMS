// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/staff/model/services/chek_code_service.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_text_from_field.dart';

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
                    kFirstColor,
                    kFirstColor2,
                  ],
                ),
              ),
              child: Stack(
                children: [
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
                              'Reset Password',
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
                          'Page',
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
                                if (!value.isEmail) {
                                  return 'Enter a valid email address';
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
                                        e.toString(),
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
                              Column(
                                children: [
                                  SizedBox(height: 2.h),
                                  CustomTextFromField(
                                    icon: IconButton(
                                      icon: const Icon(Icons.done),
                                      onPressed: () async {
                                        if (controller.formState.currentState!
                                            .validate()) {
                                          controller.loadingIndecatorTrue();
                                          try {
                                            await CheckCodeService().checkCode(
                                              email: controller.email.text,
                                              code: controller.code.text,
                                            );
                                            controller.showSnackBar(
                                              context,
                                              'Code is correct, Now you can change your password.',
                                            );
                                            controller.codeVisible();
                                            controller.newPasswordVisible();
                                            controller.loadingIndecatorFalse();
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
                                    ),
                                    onChanged: (value) {
                                      controller.code.text = value;
                                    },
                                    textEditingController: controller.code,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    text: 'Code',
                                    hintText: 'Enter The Code',
                                    toggleVisibility: false,
                                  ),
                                ],
                              ),
                            if (controller.isnewPasswordVisible)
                              Column(
                                children: [
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
                                    text: 'Password',
                                    hintText: 'Enter Your New Password',
                                    icon: const Icon(Icons.remove_red_eye),
                                    toggleVisibility: true,
                                  ),
                                  SizedBox(height: 2.h),
                                  CustomTextFromField(
                                    onChanged: (value) {
                                      controller.confirmPassword.text = value;
                                    },
                                    textEditingController:
                                        controller.confirmPassword,
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
                                    text: 'Confirm Password',
                                    hintText: 'Confirm Your New Password',
                                    icon: const Icon(Icons.remove_red_eye),
                                    toggleVisibility: true,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 5.h,
                                    ),
                                    child: CustomButton(
                                      text: 'Submit',
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          kFirstColor,
                                          kFirstColor2,
                                        ],
                                      ),
                                      onPressed: () async {
                                        if (controller.formState.currentState!
                                            .validate()) {
                                          controller.loadingIndecatorTrue();
                                          try {
                                            await controller
                                                .forgetPasswordConfirm(
                                                    controller);
                                            controller.loadingIndecatorFalse();
                                            controller.showSnackBar(
                                              context,
                                              'Password reset successful',
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
          ),
        );
      },
    );
  }
}
