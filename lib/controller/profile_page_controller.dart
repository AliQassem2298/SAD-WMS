import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';

class ProfilePageController extends GetxController {
  static String id = '/ProfilePage';

  double containerHeight = 0.0;
  UserModel? userModel;
  @override
  void onInit() {
    super.onInit();
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
