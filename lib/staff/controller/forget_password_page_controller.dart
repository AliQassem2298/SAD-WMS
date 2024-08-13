import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/model/models/forget_password_request_model.dart';
import 'package:warehouse_manegment_system/staff/model/services/forget_password_confirm_service.dart';
import 'package:warehouse_manegment_system/staff/model/services/forget_password_request_service.dart';

class ForgetPasswordPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String id = '/ForgetPasswordPage';
  bool isCodeVisible = false;
  bool isnewPasswordVisible = false;
  double containerHeight = 0;

  late AnimationController animationController;
  late Animation<Offset> slideAnimation1;
  late Animation<Offset> slideAnimation2;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // String? email;
  // String? code;
  // String? password;

  @override
  void onInit() {
    Future.delayed(
      const Duration(microseconds: 1),
      () {
        containerHeight = 65.h;
        update();
      },
    );
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    slideAnimation1 = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    slideAnimation2 = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    animationController.forward();
    super.onReady();
  }

  void codeVisible() {
    isCodeVisible = true;
    update();
  }

  void newPasswordVisible() {
    isnewPasswordVisible = true;
    update();
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

  Future<ForgetPasswordRequestModel> forgetPasswordRequest(
      ForgetPasswordPageController controller) {
    return ForgetPasswordRequestService()
        .forgetPasswordRequest(email: controller.email.text);
  }

  Future<ForgetPasswordRequestModel> forgetPasswordConfirm(
      ForgetPasswordPageController controller) async {
    return ForgetPasswordConfirmService().forgetPasswordConfirm(
      email: controller.email.text,
      code: controller.code.text,
      password: controller.password.text,
      confirmPassword: controller.confirmPassword.text,
    );
  }
}
