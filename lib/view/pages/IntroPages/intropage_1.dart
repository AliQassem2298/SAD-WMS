import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_manegment_system/constans.dart';

class IntroPage_1 extends StatelessWidget {
  const IntroPage_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    colors: [
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                      kWhiteColor,
                      kFourthColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                  'assets/animations/85795-man-and-woman-say-hi.json',
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
                        "Welcome to our WMS!",
                        style: TextStyle(
                          fontSize:
                              ScreenSizeConfig.getProportionateScreenWidth(6),
                          color: kWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height:
                            ScreenSizeConfig.getProportionateScreenHeight(1),
                      ),
                      Text(
                        "Our app empowers efficient",
                        style: TextStyle(
                          fontSize:
                              ScreenSizeConfig.getProportionateScreenWidth(5),
                          color: kWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height:
                            ScreenSizeConfig.getProportionateScreenHeight(1),
                      ),
                      Text(
                        "warehouse operations.",
                        style: TextStyle(
                          fontSize:
                              ScreenSizeConfig.getProportionateScreenWidth(5),
                          color: kWhiteColor,
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
