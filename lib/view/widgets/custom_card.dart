// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.text,
    required this.image,
    required this.routname,
    super.key,
  });
  String text, image, routname;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(routname);
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(),
          boxShadow: [
            // BoxShadow(
            //   offset: Offset(-3, -3),
            //   color: kWhiteColor,
            //   blurRadius: 12,
            // ),
          ],
          borderRadius: BorderRadius.circular(35),
        ),
        child: Stack(
          children: [
            Container(
              // height: 188,
              width: 185,
              decoration: BoxDecoration(
                // border: Border.all(),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 5),
                    color: Color.fromARGB(50, 0, 0, 0),
                    blurRadius: 10,
                  ),
                ],
                border: Border(top: BorderSide(width: 2)),
                color: kThierdColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.local_shipping,
                  //   color: Colors.white,
                  //   size: 110,
                  // ),
                  Image.asset(
                    image,
                    height: 135,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(),
            //   child: Container(
            //     // child:
            //     height: 125,
            //     width: 175,
            //     decoration: BoxDecoration(
            //       // border: Border.all(),
            //       // boxShadow: [],
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(35),
            //         topRight: Radius.circular(35),
            //       ),
            //       // gradient: LinearGradient(
            //       //   begin: Alignment.topCenter,
            //       //   end: Alignment.bottomCenter,
            //       //   colors: [
            //       //     const Color.fromARGB(130, 255, 255, 255),
            //       //     Colors.white38,
            //       //     Colors.white24,
            //       //     const Color.fromARGB(1, 255, 255, 255),
            //       //   ],
            //       // ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
