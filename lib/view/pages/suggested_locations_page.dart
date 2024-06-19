import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
import 'package:warehouse_manegment_system/controller/suggested_locations_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';
import 'package:warehouse_manegment_system/model/models/suggested_locations_model.dart';
import 'package:warehouse_manegment_system/model/services/put_away_product_service.dart';
import 'package:warehouse_manegment_system/model/services/suggersted_locations_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_suggested_location_card.dart';

class SuggestedLocationsPage extends StatelessWidget {
  SuggestedLocationsPage({super.key});
  final BarcodeController barcodeController = Get.put(BarcodeController());

  final PutAwayPageController putAwayPageController =
      Get.put(PutAwayPageController());

  @override
  Widget build(BuildContext context) {
    ShipmentDetailsModel shipments =
        ModalRoute.of(context)!.settings.arguments as ShipmentDetailsModel;
    return GetBuilder<SuggestedLocationsPageController>(
      init: SuggestedLocationsPageController(),
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
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                    top: 3.h,
                    bottom: 3.h,
                  ),
                  child: FutureBuilder<SuggestedLocationModel>(
                    future: SuggestedLocationsService().suggestedLocations(
                      id: shipments.id,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        controller.locations = snapshot.data!;
                        return ListView.builder(
                          itemCount: controller.locations!.locationModel.length,
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            return CustomSuggestedLocationCard(
                              locationsModel:
                                  controller.locations!.locationModel[index],
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
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
                            String scannedBarcode =
                                await barcodeController.scanBarcode();
                            DetailsModel response =
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
                          } catch (e) {
                            print(e.toString());
                            Get.snackbar(
                              '',
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
