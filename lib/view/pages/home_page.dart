import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/controller/inventory_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';
import 'package:warehouse_manegment_system/controller/stocktaking_page_controller.dart';
import 'package:warehouse_manegment_system/controller/transfer_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      //     ),
      //   )
      // ],
      appBar: AppBar(
        backgroundColor: Color(0xFFB0BEC5),

        automaticallyImplyLeading:
            false, // // backgroundColor: Color(0xffd9dadb),
        // title: Text('Warehouse management system'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 27),
            child: Text(
              'WMS',
              style: TextStyle(
                color: Color(0xFF607D8B),
                fontSize: 32,
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
      backgroundColor: Color(0xFFB0BEC5),
      body: sharedPreferences!.getString("role") == "staff"
          ? GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              children: [
                InkWell(
                  onTap: () {},
                  child: CustomCard(
                    routname: ShipmentsPageController.id,
                    image: 'assets/Shipments.png',
                    text: "Shippments",
                  ),
                ),
                CustomCard(
                  routname: PutAwayPageController.id,
                  image: 'assets/Put Away.png',
                  text: "Put Away",
                ),
                CustomCard(
                  routname: OrdersPageController.id,
                  image: 'assets/Orders.png',
                  text: "Orders",
                ),
                CustomCard(
                  routname: TransferPageController.id,
                  image: 'assets/Transfer.png',
                  text: "Transfer",
                ),
                CustomCard(
                  routname: StocktakingPageController.id,
                  image: 'assets/Stocktaking.png',
                  text: "Stocktaking",
                ),
                CustomCard(
                  routname: InventoryScanPageController.id,
                  image: 'assets/Inventory Scan.png',
                  text: "Inventory Scan",
                ),
              ],
            )
          : sharedPreferences!.getString("role") == "customer"
              ? Center(
                  child: Text(
                    'Welcome Customer',
                    style: TextStyle(fontSize: 25),
                  ),
                )
              : Center(
                  child: Text(
                    'Welcome Geust',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
    );
  }
}
