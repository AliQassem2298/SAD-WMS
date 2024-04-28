// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';
import 'package:warehouse_manegment_system/model/services/sign_up_service.dart';

class SignUpPageController extends GetxController {
  static String id = '/SingUpPage';
  double containerHeight = 0;
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController role = TextEditingController();

  // String? fullName;
  // String? number;
  // String? email;
  // String? password;
  // String? confirmPassword;

  @override
  void onInit() {
    super.onInit();
    // Start a timer to change the container height after 5 seconds
    Future.delayed(
      const Duration(microseconds: 1),
      () {
        containerHeight = 500;
        update();
      },
    );
  }

  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    update();
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    update();
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<SignInModel> signUp(SignUpPageController controller) {
    print('role: ${controller.role.text}');
    return SignUpService().signUp(
      firstName: controller.firstName.text,
      lastName: controller.lastName.text,
      userName: controller.userName.text,
      email: controller.email.text,
      password: controller.password.text,
      confirmPassword: controller.confirmPassword.text,
      role: controller.role.text,
    );
  }
}
