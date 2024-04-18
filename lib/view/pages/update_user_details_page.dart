// ignore_for_file: avoid_print, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/update_user_details_controller.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';
import 'package:warehouse_manegment_system/model/services/update_user_details_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

class UpdateUserDetailsPage extends StatelessWidget {
  UpdateUserDetailsPage({super.key});

  TextEditingController lastName = TextEditingController();

  TextEditingController firstNmae = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return GetBuilder<UpdateUserDetailsController>(
      init: UpdateUserDetailsController(),
      builder: (controller) {
        controller.firstName.text = userModel.firstName;
        controller.lastName.text = userModel.lastName;
        controller.email.text = userModel.email;

        controller.userName.text = userModel.username;

        return Scaffold(
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
                  padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Update User',
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
                        'Details Page',
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
                          horizontal: 30,
                          vertical: 25,
                        ),
                        children: [
                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.firstName.text = userModel.firstName;
                              }
                              controller.firstName.text = value;
                            },
                            textEditingController: firstNmae,
                            hintText: 'Enter Your First Name',
                            text: 'First Name',
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.lastName.text = userModel.lastName;
                              }
                              controller.lastName.text = value;
                            },
                            textEditingController: lastName,
                            hintText: 'Enter Your Last Name',
                            text: 'Last Name',
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.userName.text = userModel.username;
                              }
                              controller.userName.text = value;
                            },
                            textEditingController: userName,
                            hintText: 'Enter Your User Name',
                            text: 'Username',
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.email.text = userModel.email;
                              }
                              controller.email.text = value;
                            },
                            textEditingController: email,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 25,
                            ),
                            child: CustomButton(
                              onPressed: () {
                                if (controller.formState.currentState!
                                    .validate()) {
                                  controller.loadingIndecatorTrue();

                                  try {
                                    UpdateUserDetailsService()
                                        .userUpdateDetails(
                                      firstName: firstNmae.text == ""
                                          ? controller.firstName.text
                                          : firstNmae.text,
                                      lastName: lastName.text == ""
                                          ? controller.lastName.text
                                          : lastName.text,
                                      userName: userName.text == ""
                                          ? controller.userName.text
                                          : userName.text,
                                      email: email.text == ""
                                          ? controller.email.text
                                          : email.text,
                                    );
                                    print('succsess');
                                    controller.loadingIndecatorFalse();
                                    controller.showSnackBar(
                                      context,
                                      'User Info Updated successfully',
                                    );
                                  } catch (e) {
                                    print(e.toString());
                                    controller.showSnackBar(
                                      context,
                                      'At least one of the following fields is required: First Name, Last Name, Email, Username',
                                    );
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'Update',
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
