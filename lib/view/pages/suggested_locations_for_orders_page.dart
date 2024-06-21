import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/customers_order_page_controller.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/controller/suggested_locations_for_orders_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';
import 'package:warehouse_manegment_system/model/models/order_model.dart';
import 'package:warehouse_manegment_system/model/models/pick_list_for_order_detail_model.dart';
import 'package:warehouse_manegment_system/model/services/pick_list_for_order_details_service.dart';
import 'package:warehouse_manegment_system/model/services/pick_product_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_suggested_locations_for_orders_card.dart';

class SuggestedLocationsForOrdersPage extends StatelessWidget {
  SuggestedLocationsForOrdersPage({super.key});
  final BarcodeController barcodeController = Get.put(BarcodeController());
  final CustomerOrderPageController customerOrderPageController =
      Get.put(CustomerOrderPageController());
  final OrdersPageController ordersPageController =
      Get.put(OrdersPageController());
  @override
  Widget build(BuildContext context) {
    OrderModel order = ModalRoute.of(context)!.settings.arguments as OrderModel;
    return GetBuilder<SuggestedLocationsForOrdersPageController>(
      init: SuggestedLocationsForOrdersPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: kFirstColor2,
            title: Text(
              'Suggested Locations Page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              // ListView.builder(
              //   padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
              //   clipBehavior: Clip.none,
              //   itemBuilder: (context, index) {
              //     return CustomSuggestedLocationCard();
              //   },
              // ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      kWhiteColor,
                      kWhiteColor,
                    ],
                  ),
                ),
                child: FutureBuilder<PickListForOrderDetailModel>(
                  future:
                      PickListForOrderDetailService().pickListForOrderDetail(
                    id: order.id,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.pickLocationModel.isNotEmpty) {
                      controller.locations = snapshot.data!;
                      int locationCount =
                          controller.locations!.pickLocationModel.length;
                      if (locationCount == 1) {
                        return Center(
                          child: CustomSuggestedLocationForOrdersCard(
                            pickLocationsModel:
                                controller.locations!.pickLocationModel[0],
                          ),
                        );
                      }
                      if (locationCount == 2) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomSuggestedLocationForOrdersCard(
                                  pickLocationsModel: controller
                                      .locations!.pickLocationModel[0],
                                ).paddingOnly(right: 1.5.w),
                                CustomSuggestedLocationForOrdersCard(
                                  pickLocationsModel: controller
                                      .locations!.pickLocationModel[1],
                                ).paddingOnly(left: 1.5.w),
                              ],
                            ).paddingSymmetric(horizontal: 2.w),
                          ],
                        ).paddingOnly(top: 1.h);
                      } else if (locationCount >= 3) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomSuggestedLocationForOrdersCard(
                                  pickLocationsModel: controller
                                      .locations!.pickLocationModel[0],
                                ).paddingOnly(right: 1.5.w),
                                CustomSuggestedLocationForOrdersCard(
                                  pickLocationsModel: controller
                                      .locations!.pickLocationModel[1],
                                ).paddingOnly(left: 1.5.w),
                              ],
                            ).paddingSymmetric(horizontal: 2.w),
                            CustomSuggestedLocationForOrdersCard(
                              pickLocationsModel:
                                  controller.locations!.pickLocationModel[2],
                            ).paddingOnly(top: 1.h),
                          ],
                        ).paddingOnly(top: 1.h);
                      } else {
                        return Container();
                      }
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return Center(
                        child: Text('No data available'),
                      );
                    }
                  },
                ),
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
                        kWhiteColor,
                        kWhiteColor,
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
                            String? scannedBarcode =
                                await barcodeController.scanBarcode();
                            if (scannedBarcode != null) {
                              DetailModel response =
                                  await PickProductService().pickProduct(
                                id: order.id,
                                barcode: scannedBarcode,
                              );

                              customerOrderPageController.up();
                              ordersPageController.up();
                              Get.back();

                              print('Success: ${response.detail}');
                              Get.snackbar(
                                'Success',
                                response.detail,
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
                          } catch (e) {
                            print(e.toString());
                            Get.snackbar(
                              'Error',
                              e.toString(),
                              colorText: Colors.white,
                            );
                          }
                        },
                        text: 'Scan',
                        fontSize: 7.w,
                        textColor: kWhiteColor,
                        gradient: const LinearGradient(
                          colors: [
                            kFirstColor2,
                            kFirstColor2,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
