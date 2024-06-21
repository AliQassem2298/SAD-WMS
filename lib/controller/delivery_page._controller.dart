import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class DeliveryPageController extends GetxController {
  static String id = '/DeliveryPage';
  bool animated = false;
  double containerHeight = 0.0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController deliveryMan = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  void onInit() {
    super.onInit();
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
}
