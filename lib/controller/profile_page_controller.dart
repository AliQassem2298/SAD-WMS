import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  static String id = '/ProfilePage';

  double containerHeight = 0.0;

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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
