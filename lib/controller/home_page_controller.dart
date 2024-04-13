import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/logout_model.dart';
import 'package:warehouse_manegment_system/model/services/log_out_service.dart';

class HomePageController extends GetxController {
  static String id = '/homePage';

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

  Future<LogoutModel> logOut() {
    return LogOutService().logOut();
  }
}
