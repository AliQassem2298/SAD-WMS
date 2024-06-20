// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';
import 'package:warehouse_manegment_system/model/services/receive_shipment_product.dart';

class CustomSupplierCard extends StatelessWidget {
  final BarcodeController barcodeController = Get.put(BarcodeController());
  final SupplierShipmentPagController supplierShipmentPagController =
      Get.put(SupplierShipmentPagController());
  final ShipmentsPageController shipmentsPageController =
      Get.put(ShipmentsPageController());
  ShipmentDetailsModel shipmentDetailsModel;
  CustomSupplierCard({
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
                  'name: ${shipmentDetailsModel.product.name}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
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

                Text(
                  'status: ${shipmentDetailsModel.status}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kSecondtColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 4.5.w,
                  ),
                ),
                SizedBox(
                  height: 4.5.h,
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
            top: 3.h,
            left: 6.w,
            child: Container(
              height: 5.h,
              width: 10.w,
              decoration: BoxDecoration(
                color: kCardBackGroundColor,
                // border: Border.all(),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: shipmentDetailsModel.status == 'pending'
                  ? Image.asset('assets/clock2.jpg')
                  : shipmentDetailsModel.status == 'received'
                      ? Image.asset('assets/done.png')
                      : Image.asset('assets/box icon.png'),
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            child: shipmentDetailsModel.status == 'pending'
                ? Container(
                    height: 5.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      // color: kSecondtColor,
                      border: Border.all(color: kFirstColor2, width: 0.8.w),
                      // boxShadow: [],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                      ),
                    ),
                    child: InkWell(
                      onTap: () async {
                        try {
                          String? scannedBarcode =
                              await barcodeController.scanBarcode();

                          if (scannedBarcode != null) {
                            DetailsModel response =
                                await ReceiveShipmentProduct()
                                    .receiveShipmentProduct(
                              id: shipmentDetailsModel.shipment,
                              barcode: scannedBarcode,
                            );
                            supplierShipmentPagController.up();
                            shipmentsPageController.up();
                            print('Success: ${response.detail}');
                            Get.snackbar(
                              'Success',
                              response.detail,
                              colorText: Colors.white,
                            );
                          } else {
                            // Handle the case where the scan was cancelled
                            print('Scan was cancelled.');
                            Get.snackbar(
                              'Cancelled',
                              'Scan was cancelled.',
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          // Handle any errors
                          print(e.toString());
                          Get.snackbar(
                            'Error',
                            e.toString(),
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Scan',
                          style: TextStyle(
                            color: kFirstColor,
                            fontSize: 4.5.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
