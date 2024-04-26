import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController password = TextEditingController();

  // String? dialogTitle;
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
