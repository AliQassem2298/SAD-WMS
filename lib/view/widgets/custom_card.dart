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
    ScreenSizeConfig.init(context);

    return InkWell(
      onTap: onTap ??
          () {
            if (routname != null) {
              Get.toNamed(routname!);
            }
          },
      child: Container(
        width: ScreenSizeConfig.blockSizeHorizontal * 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 10,
            ),
          ],
          color: kFirstColor2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.none,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 7, color: kFirstColor2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Image.asset(
                image,
                height: ScreenSizeConfig.blockSizeVertical * 21,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: ScreenSizeConfig.blockSizeHorizontal * 4.6,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ScreenSizeConfig.blockSizeVertical * 1.5),
          ],
        ),
      ),
    ).paddingSymmetric(
      vertical: ScreenSizeConfig.blockSizeVertical * 1.3,
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
  