import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
// import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/customers_order_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_customer_order_card.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_supplier_card.dart';

class CustomerOrderPage extends StatelessWidget {
  CustomerOrderPage({super.key});
  // final BarcodeController barcodeController = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerOrderPageController>(
      init: CustomerOrderPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
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
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Customer\'s Order',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: kSecondtColor,
          ),
          body: Container(
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
            child: Stack(
              children: [
                GridView.builder(
                  itemBuilder: (context, index) {
                    return CustomCustomerOrderCard()
                        .paddingOnly(left: 10, right: 10);
                  },
                  // padding: EdgeInsets.symmetric(horizontal: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 0,
                    // crossAxisSpacing: 0,
                    childAspectRatio: 5 / 7.5,
                  ),
                  // children: [
                  //   CustomSupplierCard(),
                  //   CustomSupplierCard(),
                  //   CustomSupplierCard()
                  // ],
                ),
                Positioned(
                  bottom: 0.h,
                  left: 0.w,
                  child: Container(
                    height: 13.h,
                    width: 100.w,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                    child: Column(
                      children: [
                        CustomButton(
                          hasBorder: true,
                          onPressed: () async {
                            try {
                              // String? scannedBarcode =
                              //     await barcodeController.scanBarcode();
                              // if (scannedBarcode != null) {
                              //   DetailsModel response =
                              //       await PutAwayProductService()
                              //           .putAwayProduct(
                              //     shipmentDetailId: controller
                              //         .locations!.shipmentDetailId
                              //         .toString(),
                              //     locationBarcode: scannedBarcode,
                              //     quantity:
                              //         controller.locations!.quantity.toString(),
                              //   );

                              //   putAwayPageController.up();

                              //   Get.back();

                              //   print('Success: ${response.detail}');
                              //   Get.snackbar(
                              //     'Success',
                              //     response.detail,
                              //     colorText: Colors.white,
                              //   );
                              // } else {
                              //   print('Scan was cancelled.');
                              //   Get.snackbar(
                              //     'Cancelled',
                              //     'Scan was cancelled.',
                              //     colorText: Colors.white,
                              //   );
                              // }
                            } catch (e) {
                              print(e.toString());
                              Get.snackbar(
                                'Error',
                                e.toString(),
                                colorText: Colors.white,
                              );
                            }
                          },
                          text: 'Pack',
                          fontSize: 7.w,
                          textColor: kFirstColor,
                          gradient: const LinearGradient(
                            colors: [
                              kWhiteColor,
                              kWhiteColor,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   child: Container(
                //     height: 100,
                //     width: 400,
                //     decoration: const BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.centerRight,
                //         end: Alignment.centerLeft,
                //         colors: [
                //           kFirstColor,
                //           kFirstColor2,
                //         ],
                //       ),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 75,
                //       vertical: 25,
                //     ),
                //     child: Column(
                //       children: [
                //         CustomButton(
                //           hasBorder: true,
                //           borderColor: Colors.transparent,
                //           onPressed: () {
                //             // barcodeController.scanBarcode();
                //           },
                //           text: 'Pack',
                //           fontSize: 24,
                //           textColor: kSecondtColor,
                //           gradient: const LinearGradient(
                //             colors: [
                //               kWhiteColor,
                //               kWhiteColor,
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                /////////////////////////////////////////////////////////////////////////////////////
                // Positioned(
                //   bottom: 75,
                //   left: 0,
                //   child: Obx(
                //     () {
                //       return Text(
                //         'Scan result: ${barcodeController.scannedBarcodes}\n',
                //         // style: const TextStyle(fontSize: 20),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
