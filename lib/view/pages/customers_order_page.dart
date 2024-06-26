import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
// import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/customers_order_page_controller.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';
import 'package:warehouse_manegment_system/model/models/see_order_details_model.dart';
import 'package:warehouse_manegment_system/model/services/pack_order_service.dart';
import 'package:warehouse_manegment_system/model/services/see_order_details_service.dart';
// import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_customer_order_card.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_supplier_card.dart';

class CustomerOrderPage extends StatelessWidget {
  CustomerOrderPage({super.key});
  // final BarcodeController barcodeController = Get.put(BarcodeController());
  final OrdersPageController ordersPageController =
      Get.put(OrdersPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerOrderPageController>(
      init: CustomerOrderPageController(),
      builder: (controller) {
        controller.listAllOrdersModel =
            ModalRoute.of(context)!.settings.arguments as ListAllOrdersModel;
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
              '${controller.listAllOrdersModel!.customerModel.username}\'s Order',
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
                // GridView.builder(
                //   itemBuilder: (context, index) {
                //     return CustomCustomerOrderCard()
                // .paddingOnly(left: 10, right: 10);
                //   },
                // padding: EdgeInsets.symmetric(horizontal: 8),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     // mainAxisSpacing: 0,
                //     // crossAxisSpacing: 0,
                // childAspectRatio: 5 / 7.5,
                //   ),
                //   // children: [
                //   //   CustomSupplierCard(),
                //   //   CustomSupplierCard(),
                //   //   CustomSupplierCard()
                //   // ],
                // ),
                FutureBuilder<SeeOrderDetailModel>(
                  future: SeeOrderDetailsService()
                      .seeOrderDetails(id: controller.listAllOrdersModel!.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: TextStyle(
                            fontSize: 6.w,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        controller.seeOrderDetailModel = snapshot.data!;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0.h,
                            crossAxisSpacing: 0.w,
                            childAspectRatio: 5 / 7.5,
                          ),
                          itemCount:
                              controller.seeOrderDetailModel!.details.length,
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            return CustomCustomerOrderCard(
                              orderModel: controller
                                  .seeOrderDetailModel!.details[index],
                            ).paddingOnly(left: 2.5.w, right: 2.5.w);
                          },
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
                        controller.listAllOrdersModel!.status == 'picked'
                            ? CustomButton(
                                hasBorder: true,
                                onPressed: () async {
                                  try {
                                    DetailModel response =
                                        await PackOrderService().packOrder(
                                      id: controller.listAllOrdersModel!.id,
                                    );
                                    ordersPageController.up();

                                    controller.up();

                                    Get.back();

                                    print('Success: ${response.detail}');
                                    Get.snackbar(
                                      'Success',
                                      response.detail,
                                      colorText: Colors.white,
                                    );
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
                              )
                            : Container(),
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
