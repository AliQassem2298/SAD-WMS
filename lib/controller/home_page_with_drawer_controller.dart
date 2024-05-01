import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';
import 'package:warehouse_manegment_system/model/services/log_out_service.dart';

class HomePageWithDrawerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String id = '/HomePageWithDrawer';
  RxBool isDrawerClose = true.obs;
  RxBool isSideMenuClose = true.obs;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    )..addListener(() {
        update();
      });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void toggleDrawer() {
    if (isDrawerClose.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    isDrawerClose.toggle();
    isSideMenuClose.toggle();
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

  Future<DetailsModel> logOut() {
    return LogoutService().logOut();
  }
}
