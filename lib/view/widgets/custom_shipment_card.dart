// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomShipmentCard extends StatelessWidget {
  CustomShipmentCard({
    required this.supplierName,
    required this.status,
    required this.image,
    super.key,
  });
  String supplierName, status, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
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
                color: kCardBackGroundColor,
                // border: Border.all(),
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
                    'Shipment from ${supplierName}',
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
                    'Status :${status}',
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
                child: Image.asset(
                  image,
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
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
