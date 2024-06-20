import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomCustomerOrderCard extends StatelessWidget {
  const CustomCustomerOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(left: 1.w, right: 1.w, bottom: 1.h),
              width: 60.w,
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
                      fontSize: 5.5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'quantity: 80',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 4.7.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    r'price: 80$',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 4.7.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'status: pending',
                    style: TextStyle(
                      color: kFirstColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 4.7.w,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
            Positioned(
              top: -7.h,
              left: 9.w,
              child: Container(
                height: 14.h,
                width: 28.w,
                decoration: BoxDecoration(
                  // color: kSecondtColor,
                  border: Border.all(color: kSecondtColor, width: 0.8.w),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/wms-logo-final.png',
                  height: 14.h,
                  width: 28.w,
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              right: 0.w,
              child: Container(
                height: 5.h,
                width: 45.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      kFirstColor2,
                      kFirstColor,
                    ],
                  ),
                  // color: kSecondtColor,
                  // border: Border.all(
                  //   color: kFifthColor,
                  // ),
                  // boxShadow: [],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                  color: kBackGroundColor,
                ),
                child: Center(
                  child: Text(
                    'Pick',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 3.h,
              left: 8.w,
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                  color: kBackGroundColor,
                  // border: Border.all(),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(35),
                  // color: Color(0xff9b9ca3),
                ),
                child: Image.asset(
                  'assets/clock2.jpg',
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
          ],
        ),
      ),
    );
  }
}
