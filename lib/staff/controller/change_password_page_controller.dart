import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class ChangePasswordPageController extends GetxController {
  static String id = '/ChangePasswordPage';
  double containerHeight = 0.0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Start a timer to change the container height after 5 seconds
    Future.delayed(
      const Duration(microseconds: 1),
      () {
        containerHeight = 65.h;
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
}
