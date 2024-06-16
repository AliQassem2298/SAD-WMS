// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/list_shipment_model.dart';

class CustomShipmentCard extends StatelessWidget {
  ListShipmentModel listShipmentModel;
  CustomShipmentCard({
    required this.listShipmentModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          SupplierShipmentPagController.id,
          arguments: listShipmentModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 25,
              ),
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: kCardBackGroundColor,
                border: Border.all(color: kFirstColor2, width: 3),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.local_shipping,
                  //   color: Colors.white,
                  //   size: 110,
                  // ),
                  Text(
                    'Shipment from ${listShipmentModel.supplierModel.name}',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Status :${listShipmentModel.status}',
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).paddingOnly(left: 40),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  // border: Border.all(),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(35),
                  // color: Color(0xff9b9ca3),
                ),
                child: listShipmentModel.status == 'pending'
                    ? Image.asset('assets/clock.jpg')
                    : listShipmentModel.status == 'received'
                        ? Image.asset('assets/done.jpg')
                        : Image.asset('assets/box icon.png'),
              ),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kCardBackGroundColor,
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: kSecondtColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
