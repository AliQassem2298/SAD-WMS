import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String image;
  final String? routname;
  final Function()? onTap;

  CustomCard({
    required this.text,
    required this.image,
    this.routname,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            if (routname != null) {
              Get.toNamed(routname!);
            }
          },
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                image,
                width: 50.w,
                height: 20.h,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              text,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 4.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // Column(
      //   children: [
      //     Container(
      //       width: 50.w,
      //       height: 25.h,
      //       decoration: BoxDecoration(
      //         color: Colors.red,
      //         borderRadius: BorderRadius.circular(35),
      //       ),
      //       child: Image.asset(
      //         image,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       text,
      //       style: TextStyle(
      //         color: kWhiteColor,
      //         fontSize: ScreenSizeConfig.blockSizeHorizontal * 4.6,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     // SizedBox(height: ScreenSizeConfig.blockSizeVertical * 1.5),
      //   ],
      // ),
    );
  }
}


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
  