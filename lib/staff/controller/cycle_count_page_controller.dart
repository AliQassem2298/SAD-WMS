import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/model/services/cycle_count_service.dart';

class CycleCountPageController extends GetxController {
  static String id = '/CycleCountPage';
  bool animated = false;
  double containerHeight = 0.0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController quantity = TextEditingController();
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
        await CycleCountService().cycleCount(
          productBarcode: productBarcode!,
          locationBarcode: locationBarcode!,
          countedQuantity: int.parse(quantity.text),
        );

        print('success');
        Get.snackbar(
          'Success',
          'Cycle count recorded successfully.',
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
