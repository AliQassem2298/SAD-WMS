import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_manegment_system/constans.dart';

class IntroPage_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kFirstColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                // kFirstColor,
                // kSecondtColor,
                // kFourthColor,
                // kThierdColor,
                kFirstColor,
                kFirstColor2,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
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
                  color: Colors.white,
                ),
                //alignment: Alignment.topCenter,
                child: Lottie.asset(
                  'assets/animations/Animation - 1714655947424.json',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                  //fit: BoxFit.fill
                ),
              ),
              SizedBox(
                height: 85,
              ),
              Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "we have an invintory scan, put away,",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "orders from inventory tracking",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "to order fulfillment.",
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
