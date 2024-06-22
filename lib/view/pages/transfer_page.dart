import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/transfer_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

class TransferPage extends StatelessWidget {
  TransferPage({super.key});
  final BarcodeController barcodeController = Get.put(BarcodeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferPageController>(
      init: TransferPageController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Transfer Page',
                style: TextStyle(color: kWhiteColor),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      kFirstColor,
                      kFirstColor2,
                    ],
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        kFirstColor,
                        kFirstColor2,
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      height: controller.containerHeight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.5.w,
                            vertical: 5.h,
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 3.w,
                              ),
                              child: CustomButton(
                                onPressed: () async {
                                  try {
                                    controller.productBarcode =
                                        await barcodeController.scanBarcode();
                                    if (controller.productBarcode != null) {
                                      print('Success:');
                                      Get.snackbar(
                                        'Success',
                                        'Product Scanned ...!',
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      print('Scan was cancelled.');
                                      Get.snackbar(
                                        'Cancelled',
                                        'Scan was cancelled.',
                                        colorText: Colors.white,
                                      );
                                    }
                                    print('success');
                                  } catch (e) {
                                    print(e.toString());
                                    Get.snackbar(
                                      'Sorry',
                                      e.toString(),
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                                text: 'Scan Product',
                                hasBorder: true,
                                gradient: const LinearGradient(
                                  colors: [
                                    kFirstColor,
                                    kFirstColor2,
                                  ],
                                  end: Alignment.topLeft,
                                  begin: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    onPressed: () async {
                                      try {
                                        controller.fromLocationBarcode =
                                            await barcodeController
                                                .scanBarcode();
                                        if (controller.fromLocationBarcode !=
                                            null) {
                                          print('Success:');
                                          Get.snackbar(
                                            'Success',
                                            'Location Scanned ...!',
                                            colorText: Colors.white,
                                          );
                                        } else {
                                          print('Scan was cancelled.');
                                          Get.snackbar(
                                            'Cancelled',
                                            'Scan was cancelled.',
                                            colorText: Colors.white,
                                          );
                                        }
                                        print('success');
                                      } catch (e) {
                                        print(e.toString());
                                        Get.snackbar(
                                          'Sorry',
                                          e.toString(),
                                          colorText: Colors.white,
                                        );
                                      }
                                    },
                                    text: 'From',
                                    hasBorder: true,
                                    gradient: const LinearGradient(
                                      colors: [
                                        kFirstColor,
                                        kFirstColor2,
                                      ],
                                      end: Alignment.topLeft,
                                      begin: Alignment.bottomRight,
                                    ),
                                  ).paddingSymmetric(
                                    horizontal: 3.w,
                                  ),
                                ),
                                Expanded(
                                  child: CustomButton(
                                    onPressed: () async {
                                      try {
                                        controller.toLocationBarcode =
                                            await barcodeController
                                                .scanBarcode();
                                        if (controller.toLocationBarcode !=
                                            null) {
                                          print('Success:');
                                          Get.snackbar(
                                            'Success',
                                            'Location Scanned ...!',
                                            colorText: Colors.white,
                                          );
                                        } else {
                                          print('Scan was cancelled.');
                                          Get.snackbar(
                                            'Cancelled',
                                            'Scan was cancelled.',
                                            colorText: Colors.white,
                                          );
                                        }
                                        print('success');
                                      } catch (e) {
                                        print(e.toString());
                                        Get.snackbar(
                                          'Sorry',
                                          e.toString(),
                                          colorText: Colors.white,
                                        );
                                      }
                                    },
                                    text: 'To',
                                    hasBorder: true,
                                    gradient: const LinearGradient(
                                      colors: [
                                        kFirstColor,
                                        kFirstColor2,
                                      ],
                                      end: Alignment.topLeft,
                                      begin: Alignment.bottomRight,
                                    ),
                                  ).paddingSymmetric(
                                    horizontal: 3.w,
                                  ),
                                ),
                              ],
                            ),
                            CustomTextFromField(
                              onChanged: (value) {
                                controller.quantity.text = value;
                              },
                              textEditingController: controller.quantity,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field is empty';
                                }
                                int? intValue = int.tryParse(value);
                                if (intValue == null) {
                                  return 'Invalid number';
                                }
                                if (intValue <= 0) {
                                  return "Can't be negative or zero";
                                }
                                return null;
                              },
                              hintText: 'Enter The Quantity Of The Product',
                              text: 'Quantity',
                              toggleVisibility: true,
                              keyboardType: TextInputType.number,
                            ).paddingSymmetric(
                              horizontal: 7.w,
                              vertical: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              child: CustomButton(
                                onPressed: () async {
                                  await controller.submitTransfer();
                                },
                                text: 'Submit',
                                hasBorder: true,
                                gradient: const LinearGradient(
                                  colors: [
                                    kFirstColor,
                                    kFirstColor2,
                                  ],
                                  end: Alignment.topLeft,
                                  begin: Alignment.bottomRight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
