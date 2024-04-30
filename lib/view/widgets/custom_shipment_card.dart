// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
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
                    'Shipment from (${supplierName})',
                    style: TextStyle(
                      color: kFirstColor,
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
                      color: kFirstColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              left: -20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: kSecondtColor,
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
          ],
        ),
      ),
    );
  }
}
