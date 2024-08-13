import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/staff/model/services/create_replenishment_request_service.dart';

class CreateReplenishmentRequestPageController extends GetxController {
  static String id = '/CreateReplenishmentRequestPage';
  bool animated = false;
  double containerHeight = 0.0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController quantity = TextEditingController();
  TextEditingController reson = TextEditingController();
  final OrdersPageController ordersPageController =
      Get.put(OrdersPageController());
  String? productBarcode, locationBarcode;

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

  Future<void> submitCycleCount() async {
    if (formState.currentState!.validate()) {
      if (productBarcode == null || locationBarcode == null) {
        Get.snackbar(
          'Error',
          'All barcodes must be scanned before submitting.',
          colorText: Colors.white,
        );
        return;
      }

      loadingIndecatorTrue();

      try {
        await CreateReplenishmentRequestService().createReplenishmentRequest(
          productBarcode: productBarcode!,
          locationBarcode: locationBarcode!,
          quantity: int.parse(quantity.text),
          reason: reson.text,
        );
        ordersPageController.up();
        Get.back();
        print('success');
        Get.snackbar(
          'Success',
          'Replenishment request created successfully.',
          colorText: Colors.white,
        );
      } catch (e) {
        print(e.toString());
        Get.snackbar(
          'Error',
          e.toString(),
          colorText: Colors.white,
        );
      } finally {
        loadingIndecatorFalse();
      }
    }
  }
}
