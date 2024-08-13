// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/suggested_locations_for_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/shipment_details_model.dart';

class CustomPutAwayCard extends StatelessWidget {
  final BarcodeController barcodeController = Get.put(BarcodeController());
  ShipmentDetailsModel shipmentDetailsModel;

  CustomPutAwayCard({
    required this.shipmentDetailsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 9.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.2.h),
            height: 30.h,
            width: 50.w,
            decoration: BoxDecoration(
              border: Border.all(color: kFirstColor2, width: 0.8.w),
              // border: Border.all(),
              // boxShadow: [],
              borderRadius: BorderRadius.circular(35),
              // color: Color(0xff9b9ca3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Image.asset('assets/clock icon.png').paddingOnly(
                //   bottom: 40,
                //   right: 130,
                // ),
                // Icon(
                //   Icons.local_shipping,
                //   color: Colors.white,
                //   size: 110,
                // ),

                Text(
                  '${shipmentDetailsModel.product.name}',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kSecondtColor,
                    fontSize: 4.5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'quantity: ${shipmentDetailsModel.quantity}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kSecondtColor,
                    fontSize: 4.5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 6.h,
                ),
              ],
            ),
          ),
          Positioned(
            top: -7.h,
            left: 8.w,
            child: Container(
              height: 15.h,
              width: 30.w,
              decoration: BoxDecoration(
                // color: kSecondtColor,
                border: Border.all(color: kFirstColor2, width: 0.8.w),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Image.network(
                '${baseUrlImage}${shipmentDetailsModel.product.photo}',
                height: 15.h,
                width: 30.w,
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.5.w,
            child: Container(
              height: 6.5.h,
              width: 44.w,
              decoration: BoxDecoration(
                color: kFirstColor2,
                border: Border.all(color: kFirstColor2, width: 0.8.w),
                // boxShadow: [],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
                /*
                 bottom: 0.h,
            right: 1.5.w,
            child: Container(
              height: 6.5.h,
              width: 42.w,
              decoration: BoxDecoration(
                color: kFirstColor2,
                border: Border.all(color: kFirstColor2, width: 0.8.w),
                // boxShadow: [],
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),                 */
              ),
              child: InkWell(
                onTap: () {
                  // String scannedBarcode = await barcodeController.scanBarcode();

                  // try {
                  //   // DetailsModel response =
                  //   //     await ReceiveShipmentProduct().receiveShipmentProduct(
                  //   //   id: shipmentDetailsModel.shipment,
                  //   //   barcode: scannedBarcode,
                  //   // );

                  //   print('Success: ${'response.detail'}');
                  //   Get.snackbar(
                  //     'Success',
                  //     'response.detail',
                  //     colorText: Colors.white,
                  //   );
                  // } catch (e) {
                  //   print(e.toString());
                  //   Get.snackbar(
                  //     '',
                  //     e.toString(),
                  //     colorText: Colors.white,
                  //   );
                  // }
                  Get.toNamed(
                    SuggestedLocationsForShipmentPageController.id,
                    arguments: shipmentDetailsModel,
                  );
                },
                child: Center(
                  child: Text(
                    'Suggest Locations',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 4.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



            // Positioned(
            //   top: 20,
            //   left: 30,
            //   child: Container(
            //     height: 40,
            //     width: 40,
            //     decoration: BoxDecoration(
            //       color: kSecondtColor,
            //       // border: Border.all(),
            //       // boxShadow: [],
            //       borderRadius: BorderRadius.circular(35),
            //       // color: Color(0xff9b9ca3),
            //     ),
            //     child: Image.asset(
            //       'assets/clock icon.png',
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 20,
            //   left: 30,
            //   child: Container(
            //     height: 40,
            //     width: 40,
            //     decoration: BoxDecoration(
            //       color: kSecondtColor,
            //       // border: Border.all(),
            //       // boxShadow: [],
            //       borderRadius: BorderRadius.circular(35),
            //       // color: Color(0xff9b9ca3),
            //     ),
            //     child: Image.asset(
            //       'assets/clock icon.png',
            //     ),
            //   ),
            // ),
         