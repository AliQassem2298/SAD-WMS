import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_manegment_system/constans.dart';

class IntroPage_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: kFirstColor,
    //     body: Container(
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.centerRight,
    //           end: Alignment.centerLeft,
    //           colors: [
    //             // kFirstColor,
    //             // kSecondtColor,
    //             // kFourthColor,
    //             // kThierdColor,
    //             kFirstColor2,
    //             kFirstColor,
    //           ],
    //         ),
    //       ),
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 20,
    //           ),
    //           // SizedBox(height: 35,),
    //           ClipOval(
    //             clipBehavior: Clip.antiAlias,
    //             child: Container(
    //               width: MediaQuery.of(context).size.width * 0.8,
    //               height: MediaQuery.of(context).size.width * 0.8,
    //               alignment: Alignment.topCenter,
    //               child: Center(
    //                 child: Lottie.asset(
    //                   'assets/animations/72817-get-started.json',
    //                   width: MediaQuery.of(context).size.width * 0.8,
    //                   height: MediaQuery.of(context).size.width * 0.8,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 85,
    //           ),
    //           Center(
    //             child: Container(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Text(
    //                     "This is just the start explore the app, ",
    //                     style: TextStyle(fontSize: 20, color: Colors.white),
    //                     textAlign: TextAlign.center,
    //                   ),
    //                   SizedBox(
    //                     height: 5,
    //                   ),
    //                   Text(
    //                     "that will make your experience",
    //                     style: TextStyle(fontSize: 20, color: Colors.white),
    //                     textAlign: TextAlign.center,
    //                   ),
    //                   Text(
    //                     "much better find many more features",
    //                     style: TextStyle(fontSize: 20, color: Colors.white),
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
                  //alignment: Alignment.topCenter,
                  child: Lottie.asset(
                    'assets/animations/Animation - 1717191393549.json',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.contain,
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
