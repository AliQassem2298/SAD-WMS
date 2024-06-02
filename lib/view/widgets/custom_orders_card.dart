// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomOrdersCard extends StatelessWidget {
  CustomOrdersCard({
    required this.customerName,
    required this.status,
    required this.image,
    required this.totalPrice,
    this.praiority,
    super.key,
  });
  String customerName, status, image, totalPrice;
  String? praiority;
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
              height: 150,
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
                    'Custome: (${customerName})',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total Price :${totalPrice}',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
              ).paddingOnly(left: 40),
            ),
            Positioned(
              top: 40,
              left: 10,
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
              right: 0,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: kFirstColor2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Center(
                  child: Text(
                    praiority!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
