import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_manegment_system/constans.dart';

class IntroPage_2 extends StatelessWidget {
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
                kFirstColor2,

                kFirstColor,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  width: 300,
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
                    // shape: BoxShape.circle,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(30, 30, 30, 0.41),
                          blurRadius: 6,
                          offset: Offset(1, 2))
                    ],
                  ),
                  child: Lottie.asset(
                    'assets/animations/Animation - 1714653397010.json',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
                    // fit: BoxFit.contain,
                  ),
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
                        "With our WMS,",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "you'll experience streamlined processes,",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        " accurate inventory management.",
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
