import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/staff/model/models/detail_model.dart';
import 'package:warehouse_manegment_system/staff/model/services/log_out_service.dart';

class DrawerPageController extends GetxController {
  static String id = '/SlideMenu';
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

  Future<DetailModel> logOut() {
    return LogoutService().logOut();
  }
}
