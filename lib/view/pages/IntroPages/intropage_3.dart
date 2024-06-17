import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_manegment_system/constans.dart';

class IntroPage_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kFirstColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                kFirstColor,
                kFirstColor2,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenSizeConfig.getProportionateScreenHeight(2),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                      kFourthColor,
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(30, 30, 30, 0.41),
                      blurRadius: 6,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: Lottie.asset(
                  'assets/animations/Animation - 1714655947424.json',
                  width: ScreenSizeConfig.getProportionateScreenWidth(80),
                  height: ScreenSizeConfig.getProportionateScreenWidth(80),
                ),
              ),
              SizedBox(
                height: ScreenSizeConfig.getProportionateScreenHeight(10),
              ),
              Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "we have an invintory scan, put away,",
                        style: TextStyle(
                          fontSize:
                              ScreenSizeConfig.getProportionateScreenWidth(5),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height:
                            ScreenSizeConfig.getProportionateScreenHeight(1),
                      ),
                      Text(
                        "orders from inventory tracking",
                        style: TextStyle(
                          fontSize:
                              ScreenSizeConfig.getProportionateScreenWidth(5),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height:
                            ScreenSizeConfig.getProportionateScreenHeight(1),
                      ),
                      Text(
                        "to order fulfillment.",
                        style: TextStyle(
                          fontSize:
                              ScreenSizeConfig.getProportionateScreenWidth(5),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
