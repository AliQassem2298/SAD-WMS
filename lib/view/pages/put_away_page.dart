import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_put_away_card.dart';

class PutAwayPage extends StatelessWidget {
  const PutAwayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PutAwayPageController>(
      init: PutAwayPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFB0BEC5),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Put Away',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: kSecondtColor,
          ),
          body: Stack(
            children: [
              GridView.builder(
                itemBuilder: (context, index) {
                  return CustomPutAwayCard().paddingOnly(left: 10, right: 10);
                },
                // padding: EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 0,
                  // crossAxisSpacing: 0,
                  childAspectRatio: 5 / 7,
                ),
                // children: [
                //   CustomSupplierCard(),
                //   CustomSupplierCard(),
                //   CustomSupplierCard()
                // ],
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   child: Container(
              //     height: 100,
              //     width: 400,
              //     decoration: BoxDecoration(
              //       color: kBackGroundColor,
              //     ),
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 75, vertical: 25),
              //     child: Column(
              //       children: [
              //         CustomButton(
              //           hasBorder: true,
              //           borderColor: Colors.transparent,
              //           onPressed: () {
              //             // barcodeController.scanBarcode();
              //           },
              //           text: 'Pack',
              //           fontSize: 24,
              //           textColor: Colors.white,
              //           gradient: const LinearGradient(
              //             colors: [
              //               kSecondtColor,
              //               kSecondtColor,
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Positioned(
              //   bottom: 75,
              //   left: 0,
              //   child: Obx(
              //     () {
              //       return Text(
              //         'Scan result: ${barcodeController.scannedBarcodes}\n',
              //         // style: const TextStyle(fontSize: 20),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
