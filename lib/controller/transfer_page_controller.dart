import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';
import 'package:warehouse_manegment_system/model/services/transfer_product_service.dart';

class TransferPageController extends GetxController {
  static String id = '/TransferPage';
  bool animated = false;
  double containerHeight = 0.0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController quantity = TextEditingController();
  String? productBarcode, fromLocationBarcode, toLocationBarcode;
  DetailModel? response;

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

  Future<void> submitTransfer() async {
    if (formState.currentState!.validate()) {
      if (productBarcode == null ||
          fromLocationBarcode == null ||
          toLocationBarcode == null) {
        Get.snackbar(
          'Error',
          'All barcodes must be scanned before submitting.',
          colorText: Colors.white,
        );
        return;
      }

      loadingIndecatorTrue();

      try {
        await TransferProductService().trasferProduct(
          productBarcode: productBarcode!,
          fromLocationBarcode: fromLocationBarcode!,
          toLocationBarcode: toLocationBarcode!,
          quantity: int.parse(quantity.text),
        );

        print('success');
        Get.snackbar(
          'Success',
          'Product transfer completed successfully.',
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
