import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';

class UpdateUserDetailsController extends GetxController {
  static String id = '/UpdateUserDetailsPage';
  double containerHeight = 0.0;
  UserModel? userModel;
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();

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

  void up() {
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
