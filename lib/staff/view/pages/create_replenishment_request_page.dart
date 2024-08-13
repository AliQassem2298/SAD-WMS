import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_text_from_field.dart';

import '../../controller/create_replenishment_request_page_controller.dart';

class CreateReplenishmentRequestPage extends StatelessWidget {
  CreateReplenishmentRequestPage({super.key});
  final BarcodeController barcodeController = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateReplenishmentRequestPageController>(
      init: CreateReplenishmentRequestPageController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Create Replenishment Request',
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
                              vertical: 3.h,
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
                          CustomButton(
                            onPressed: () async {
                              try {
                                controller.locationBarcode =
                                    await barcodeController.scanBarcode();
                                if (controller.locationBarcode != null) {
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
                            text: 'Scan Location',
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
                            toggleVisibility: false,
                            keyboardType: TextInputType.number,
                          ).paddingSymmetric(
                            horizontal: 7.w,
                            vertical: 1.5.h,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.reson.text = value;
                            },
                            textEditingController: controller.reson,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field is empty';
                              }

                              return null;
                            },
                            hintText: 'Enter The Reason Of The Request',
                            text: 'Reason',
                            toggleVisibility: false,
                          ).paddingSymmetric(
                            horizontal: 7.w,
                            vertical: 1.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            child: CustomButton(
                              onPressed: () async {
                                await controller.submitCycleCount();
                              },
                              text: 'Create Request',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
