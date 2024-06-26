import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/barcode_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/delivery_page._controller.dart';
import 'package:warehouse_manegment_system/controller/replenishment_page_controller.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';
import 'package:warehouse_manegment_system/controller/cycle_count_page_controller.dart';
import 'package:warehouse_manegment_system/controller/transfer_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/models/product_details_by_barcode_model.dart';
import 'package:warehouse_manegment_system/model/services/list_replenishment_requests_service.dart';
import 'package:warehouse_manegment_system/model/services/product_details_by_barcode_service.dart';

import 'package:warehouse_manegment_system/view/widgets/custom_card.dart';
import 'package:warehouse_manegment_system/view/widgets/details_dialog_card.dart';

class HomePage extends StatelessWidget {
  final BarcodeController barcodeController = Get.put(BarcodeController());

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);

    return Scaffold(
      // backgroundColor: Color(0xffd9dadb),
      // backgroundColor: Colors.white,

      // drawer: Drawer(
      //   backgroundColor: Color(0xffd9dadb),
      //   child: ListView(
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           sharedPreferences!.clear();
      //           print("Shared preferanses cleared");
      //           print(sharedPreferences!.getString("token"));
      //         },
      //         icon: Icon(Icons.delete),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           Get.toNamed(ProfilePageController.id);
      //         },
      //         // onPressed: () async {
      //         //   try {
      //         //     await Get.toNamed(ProfilePageController.id);
      //         //   } catch (e) {
      //         //     controller.showSnackBar(context, e.toString());
      //         //   }

      //         //   controller.loadingIndecatorTrue();
      //         //   try {
      //         //     await controller.logOut();
      //         //     print('succsess');
      //         //     controller.loadingIndecatorFalse();
      //         //     // print('token=$token');

      //         //     controller.showSnackBar(
      //         //       context,
      //         //       'Logout successful',
      //         //     );
      //         //     Get.offAllNamed(WelcomePageController.id);
      //         //   } catch (e) {
      //         //     print(e.toString());
      //         //     controller.showSnackBar(
      //         //       context,
      //         //       e.toString(),
      //         //     );
      //         //   }
      //         //   controller.loadingIndecatorFalse();
      //         // },
      //         icon: const Icon(Icons.supervised_user_circle_outlined),
      //       ),
      //       sharedPreferences!.getString("token") != null
      //           ? Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 50),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: Color(0xff9b9ca3),
      //                   borderRadius: BorderRadius.circular(
      //                     35,
      //                   ),
      //                 ),
      //                 padding: EdgeInsets.symmetric(
      //                   horizontal: 50,
      //                   vertical: 12,
      //                 ),
      //                 child: InkWell(
      //                   onTap: () async {
      //                     controller.loadingIndecatorTrue();
      //                     try {
      //                       await controller.logOut();
      //                       sharedPreferences!.clear();
      //                       // userId = null;
      //                       print('succsess');
      //                       controller.loadingIndecatorFalse();
      //                       // print('token=$token');
      //                       // userToken = null;

      //                       controller.showSnackBar(
      //                         context,
      //                         'Logout successful',
      //                       );
      //                       Get.offAllNamed(WelcomePageController.id);
      //                     } catch (e) {
      //                       print(e.toString());
      //                       controller.showSnackBar(
      //                         context, e.toString(),
      //                         // ' Authentication credentials were not provided.',
      //                       );
      //                     }
      //                     controller.loadingIndecatorFalse();
      //                   },
      //                   child: Row(
      //                     mainAxisAlignment:
      //                         MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Text(
      //                         "Logout",
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       Icon(
      //                         Icons.logout,
      //                         color: Color(0xff2d77c1),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             )
      //           : IconButton(
      //               onPressed: () {
      //                 Get.offAllNamed(WelcomePageController.id);
      //                 sharedPreferences!.clear();
      //               },
      //               icon: const Icon(Icons.backspace_outlined),
      //             ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 50,
      //           vertical: 16,
      //         ),
      //         child: CustomButton(
      //           hasBorder: false,
      //           gradient: LinearGradient(
      //             colors: [
      //               Color(0xff9b9ca3),
      //               Color(0xff9b9ca3),
      //             ],
      //           ),
      //           onPressed: () {
      //             //   controller.loadingIndecatorTrue();

      //             //   controller.loadingIndecatorFalse();
      //             Get.to(
      //               () => MyDialog(
      //                 dialogTitle: 'Delete Account',
      //                 hintText: 'Enter your password',
      //               ),
      //             );
      //           },
      //           text: 'Delete Account',
      //           textColor: const Color(0xffBB1636),
      //           // hasBorder: true,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 50),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Color(0xff9b9ca3),
      //         borderRadius: BorderRadius.circular(
      //           35,
      //         ),
      //       ),
      //       padding: EdgeInsets.symmetric(
      //         horizontal: 50,
      //         vertical: 12,
      //       ),
      //       child: InkWell(
      //         onTap: () async {
      //           controller.loadingIndecatorTrue();
      //           try {
      //             await controller.logOut();
      //             sharedPreferences!.clear();
      //             // userId = null;
      //             print('succsess');
      //             controller.loadingIndecatorFalse();
      //             // print('token=$token');
      //             // userToken = null;

      //             controller.showSnackBar(
      //               context,
      //               'Logout successful',
      //             );
      //             // Get.offAllNamed(WelcomePageController.id);
      //           } catch (e) {
      //             print(e.toString());
      //             controller.showSnackBar(
      //               context, e.toString(),
      //               // ' Authentication credentials were not provided.',
      //             );
      //           }
      //           controller.loadingIndecatorFalse();
      //         },
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Text(
      //               "Logout",
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Icon(
      //               Icons.logout,
      //               color: Color(0xff2d77c1),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),`
      //   )
      // ],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kFirstColor2,
        // title: Text('Warehouse management system'),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await ListReplenishmentRequestsService()
                    .listReplenishmentRequests();
              } catch (e) {
                print(e.toString());
                Get.snackbar(
                  '',
                  e.toString(),
                  colorText: Colors.white,
                );
              }
            },
            icon: Icon(Icons.abc),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSizeConfig.blockSizeHorizontal * 4),
            child: Text(
              'S.A.D',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: ScreenSizeConfig.blockSizeHorizontal * 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        // centerTitle: true,

        // leading: Builder(
        //   builder: (context) {
        //     return InkWell(
        //       onTap: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       child: Image.asset(
        //         'assets/nwms.png',
        //       ),
        //     );
        //   },
        // ),
        // automaticallyImplyLeading: false,
      ),
      // backgroundColor: kFirstColor,
      body: sharedPreferences!.getString("role") == "staff"
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    kWhiteColor,
                    kWhiteColor,

                    // kSecondtColor,
                    // kThierdColor,

                    // kFourthColor,
                  ],
                ),
              ),
              child: ListView(
                clipBehavior: Clip.none,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 24,
                //   mainAxisSpacing: 20,
                // ),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSizeConfig.blockSizeHorizontal * 4,
                  vertical: ScreenSizeConfig.blockSizeVertical * 2,
                ),
                children: [
                  CustomCard(
                    routname: ShipmentsPageController.id,
                    image: 'assets/Shipments.png',
                    text: "Shippments",
                  ),
                  CustomCard(
                    routname: PutAwayPageController.id,
                    image: 'assets/put-away.png',
                    text: "Put Away",
                  ),
                  CustomCard(
                    routname: OrdersPageController.id,
                    image: 'assets/Orders.png',
                    text: "Orders",
                  ),
                  CustomCard(
                    routname: DeliveryPageController.id,
                    image: 'assets/delivery.png',
                    text: "Delivery",
                  ),
                  CustomCard(
                    routname: TransferPageController.id,
                    image: 'assets/Transfer.png',
                    text: "Transfer",
                  ),
                  CustomCard(
                    routname: CycleCountPageController.id,
                    image: 'assets/cycle-count.png',
                    text: "Cycle Count",
                  ),
                  CustomCard(
                    routname: ReplenishmentPageController.id,
                    image: 'assets/replenishment.png',
                    text: "Replenishment",
                  ),
                  CustomCard(
                    onTap: () async {
                      try {
                        String? scannedBarcode =
                            await barcodeController.scanBarcode();
                        if (scannedBarcode != null) {
                          ProductDetailsByBarcodeModel response =
                              await ProductDetailsByBarcodeService()
                                  .productDetailsByBarcode(
                            productBarcode: scannedBarcode,
                          );
                          print('Success');
                          Get.snackbar(
                            'Success',
                            '',
                            colorText: Colors.white,
                          );
                          Get.bottomSheet(
                            CustomDetailsProductDialog(
                              productDetailsByBarcodeModel: response,
                            ),
                            enterBottomSheetDuration:
                                Duration(milliseconds: 700),
                            exitBottomSheetDuration:
                                Duration(milliseconds: 700),
                          );
                        } else {
                          print('Scan was cancelled.');
                          Get.snackbar(
                            'Cancelled',
                            'Scan was cancelled.',
                            colorText: Colors.white,
                          );
                        }

                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: const Icon(Icons.warning_amber_rounded),
                        //       content: Text('Hi'),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () {
                        //             // Navigate to home page
                        //             Navigator.of(context)
                        //                 .pop(); // Close the dialog
                        //             // Replace '/home' with your home route
                        //           },
                        //           child: Text('ok'),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                        // showDialog(
                        //   context: context,
                        //   builder: (ctx) => AlertDialog(
                        //     title: const Text("Alert Dialog Box"),
                        //     content:
                        //         const Text("This is simple alert dialog box"),
                        //     actions: <Widget>[
                        //       // TextButton(
                        //       //   onPressed: () =>
                        //       //       Navigator.pop(context, 'Cancel'),
                        //       //   child: const Text('Cancel'),
                        //       // ),
                        //       TextButton(
                        //         onPressed: () => Navigator.pop(context, 'OK'),
                        //         child: const Text('OK'),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      } catch (e) {
                        print(e.toString());
                        Get.snackbar(
                          'Error',
                          e.toString(),
                          colorText: Colors.white,
                        );
                      }
                    },
                    image: 'assets/scanner.png',
                    text: "Barcode Scanner",
                  ),
                ],
              ),
            )
          : sharedPreferences!.getString("role") == "customer"
              ? Scaffold(
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          kFirstColor,
                          kFirstColor2,

                          // kSecondtColor,
                          // kThierdColor,

                          // kFourthColor,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Welcome Customer',
                        style: TextStyle(
                          fontSize: ScreenSizeConfig.blockSizeHorizontal * 6,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          kFirstColor,
                          kFirstColor2,

                          // kSecondtColor,
                          // kThierdColor,

                          // kFourthColor,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Welcome Guest',
                        style: TextStyle(
                          fontSize: ScreenSizeConfig.blockSizeHorizontal * 6,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
