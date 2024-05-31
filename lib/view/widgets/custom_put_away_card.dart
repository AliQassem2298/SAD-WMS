import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomPutAwayCard extends StatelessWidget {
  const CustomPutAwayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 75),
      child: InkWell(
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              height: 400,
              width: 180,
              decoration: BoxDecoration(
                color: kCardBackGroundColor,
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
                    'name: cap',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'quantity: 80',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'location: asd',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   'status: pending',
                  //   style: TextStyle(
                  //     color: kFirstColor,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  SizedBox(
                    height: 35,
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
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
                  border: Border.all(color: kSecondtColor, width: 3),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/wms-logo-final.png',
                ),
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
                  border: Border.all(
                    color: kSecondtColor,
                  ),
                  // boxShadow: [],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                  color: kSecondtColor,
                ),
                child: Center(
                  child: Text(
                    'Put Away',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
