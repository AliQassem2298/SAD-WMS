// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class CustomTextFromFieldController extends GetxController {
//   final RxBool isPasswordVisible = false.obs;

//   void togglePasswordVisibility() {
//     isPasswordVisible.toggle();
//     update();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTextFromFieldController extends GetxController {
//   final TextEditingController textEditingController = TextEditingController();
//   final RxBool isPasswordVisible = false.obs;
//   final RxBool showError = false.obs;

//   void togglePasswordVisibility() {
//     isPasswordVisible.toggle();
//   }

//   void validateField(String? value) {
//     if (value == null || value.isEmpty) {
//       showError.value = true;
//     } else {
//       showError.value = false;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/////////////////////last one
class CustomTextFiledController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool showError = false.obs;

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
