// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';
import 'package:warehouse_manegment_system/model/services/receive_shipment_product.dart';

class CustomSupplierCard extends StatelessWidget {
  final BarcodeController barcodeController = Get.put(BarcodeController());

  ShipmentDetailsModel shipmentDetailsModel;
  CustomSupplierCard({
    required this.shipmentDetailsModel,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 75),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            height: 400,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(color: kFirstColor2, width: 3),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'quantity: ${shipmentDetailsModel.quantity}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kSecondtColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'status: ${shipmentDetailsModel.status}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kSecondtColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Positioned(
            top: -50,
            left: 40,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                // color: kSecondtColor,
                border: Border.all(color: kFirstColor2, width: 3),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Image.network(
                '${baseUrlImage}${shipmentDetailsModel.product.photo}',
                height: 100,
                width: 100,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: kCardBackGroundColor,
                // border: Border.all(),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: shipmentDetailsModel.status == 'pending'
                  ? Image.asset('assets/clock.jpg')
                  : shipmentDetailsModel.status == 'received'
                      ? Image.asset('assets/done.jpg')
                      : Image.asset('assets/box icon.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                // color: kSecondtColor,
                border: Border.all(color: kFirstColor2, width: 3),
                // boxShadow: [],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
              ),
              child: InkWell(
                onTap: () async {
                  String scannedBarcode = await barcodeController.scanBarcode();

                  try {
                    // Use the scanned barcode to call the API
                    DetailsModel response =
                        await ReceiveShipmentProduct().receiveShipmentProduct(
                      id: shipmentDetailsModel.id,
                      barcode: scannedBarcode,
                    );

                    print('Success: ${response.detail}');
                    Get.snackbar(
                      'Success',
                      response.detail,
                      colorText: Colors.white,
                    );
                  } catch (e) {
                    print(e.toString());
                    Get.snackbar(
                      'Sorry',
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
                      fontSize: 18,
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
