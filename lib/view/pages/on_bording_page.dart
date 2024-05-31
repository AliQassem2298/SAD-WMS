// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/onbordingcontroller.dart';
import 'package:warehouse_manegment_system/view/pages/IntroPages/intropage_1.dart';
import 'package:warehouse_manegment_system/view/pages/IntroPages/intropage_2.dart';
import 'package:warehouse_manegment_system/view/pages/IntroPages/intropage_3.dart';
import 'package:warehouse_manegment_system/view/pages/IntroPages/intropage_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingPage extends StatelessWidget {
  //controller to keep track of page
  PageController controller = PageController();
  //controller to keep track of we are on the last page or not
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        init: OnBordingController(),
        builder: (OnBordingController Getcontroller) => Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) => Getcontroller.changeIndex(index),
              children: [
                IntroPage_1(),
                IntroPage_2(),
                IntroPage_3(),
                IntroPage_4(),
              ],
            ),
            Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SKIP
                  InkWell(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      controller.jumpToPage(3);
                    },
                  ),

                  SizedBox(
                    width: 20,
                  ),
                  //dot indicator
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: WormEffect(
                      dotColor: kWhiteColor,
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: kFirstColor3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //NEXT OR Get Sated
                  Getcontroller.isLast.value
                      ? GestureDetector(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () async {
                            await Getcontroller.switchFirsTimer();
                          },
                        )
                      : GestureDetector(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
