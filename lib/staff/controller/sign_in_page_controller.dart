import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/model/models/sign_in_model.dart';
import 'package:warehouse_manegment_system/staff/model/services/sign_in_service.dart';

class SignInPageController extends GetxController {
  static String id = '/SingInPage';

  bool animated = false;
  double containerHeight = 0.0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // String? email;
  // String? password;
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

  // void showSnackBar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  Future<SignInModel> signIn(SignInPageController controller) {
    return SignInService().SignIn(
      usernameOrEmail: controller.email.text,
      password: controller.password.text,
    );
  }
}
