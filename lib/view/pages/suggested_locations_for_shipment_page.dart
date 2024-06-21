import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
import 'package:warehouse_manegment_system/controller/suggested_locations_for_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';
import 'package:warehouse_manegment_system/model/models/suggested_locations_model.dart';
import 'package:warehouse_manegment_system/model/services/put_away_product_service.dart';
import 'package:warehouse_manegment_system/model/services/suggersted_locations_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_suggested_location_for_shipment_card.dart';

class SuggestedLocationsForShipmentPage extends StatelessWidget {
  SuggestedLocationsForShipmentPage({super.key});
  final BarcodeController barcodeController = Get.put(BarcodeController());

  final PutAwayPageController putAwayPageController =
      Get.put(PutAwayPageController());

  @override
  Widget build(BuildContext context) {
    ShipmentDetailsModel shipments =
        ModalRoute.of(context)!.settings.arguments as ShipmentDetailsModel;
    return GetBuilder<SuggestedLocationsForShipmentPageController>(
      init: SuggestedLocationsForShipmentPageController(),
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
                child: FutureBuilder<SuggestedLocationModel>(
                  future: SuggestedLocationsService()
                      .suggestedLocations(id: shipments.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.locationModel.isNotEmpty) {
                      controller.locations = snapshot.data!;
                      int locationCount =
                          controller.locations!.locationModel.length;

                      if (locationCount == 2) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomSuggestedLocationForShipmentCard(
                                  locationsModel:
                                      controller.locations!.locationModel[0],
                                ).paddingOnly(right: 1.5.w),
                                CustomSuggestedLocationForShipmentCard(
                                  locationsModel:
                                      controller.locations!.locationModel[1],
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
                                CustomSuggestedLocationForShipmentCard(
                                  locationsModel:
                                      controller.locations!.locationModel[0],
                                ).paddingOnly(right: 1.5.w),
                                CustomSuggestedLocationForShipmentCard(
                                  locationsModel:
                                      controller.locations!.locationModel[1],
                                ).paddingOnly(left: 1.5.w),
                              ],
                            ).paddingSymmetric(horizontal: 2.w),
                            CustomSuggestedLocationForShipmentCard(
                              locationsModel:
                                  controller.locations!.locationModel[2],
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
                                  await PutAwayProductService().putAwayProduct(
                                shipmentDetailId: controller
                                    .locations!.shipmentDetailId
                                    .toString(),
                                locationBarcode: scannedBarcode,
                                quantity:
                                    controller.locations!.quantity.toString(),
                              );

                              putAwayPageController.up();

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
