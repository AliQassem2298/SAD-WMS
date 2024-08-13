// ignore_for_file: use_build_context_synchronously, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Services/MrOrderServices/PostOrderServices.dart';
import 'package:warehouse_manegment_system/customer/controller/basketcontroller.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Basket/BasketItemsList.dart';

import '../../../../constans.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BasketController basketController = Get.put(BasketController());
    basketController.updateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              basketController.clearBasket();
              basketItemsPlaceOrderList1.clear();
              basketItems.clear();
            },
            icon: const Icon(Icons.cleaning_services),
          ),
        ],
        backgroundColor: darkblue,
        title: Text(
          "shopping Cart".tr,
          style: const TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<BasketController>(
        builder: (controller) {
          return basketItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomScrollView(
                    slivers: [
                      const BasketItemsList(),
                      const SliverToBoxAdapter(
                        child: Divider(
                          thickness: 3,
                          color: Color(0xff013a71),
                          endIndent: 20,
                          indent: 20,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price".tr,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff003A71),
                                  ),
                                ),
                                Text(
                                  '\$${controller.totalPrice.value}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Open Sans',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 0, bottom: 10),
                              alignment: Alignment.center,
                              width: 350,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xff003A71),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  // Call the service and handle the response
                                  final result = await PostAddOrderService()
                                      .postAddOrderService(basketItems);

                                  if (result['success']) {
                                    // Handle success (e.g., show a success message or navigate to another page)
                                    showCustomSnackBar(
                                        context,
                                        'Order has been Created successfully',
                                        true);
                                    // Optionally, clear the basket or navigate to another screen
                                    basketController.clearBasket();
                                  } else {
                                    // Show error message
                                    showCustomSnackBar(
                                        context,
                                        'The Product is Currently Unavailable',
                                        false);
                                  }

                                  basketController.up();
                                },
                                child: Text(
                                  "Place Order".tr,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Open Sans',
                                    color: Color(0xffDCEFFD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          "noOrder".tr,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color(0xff003A71),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  void showCustomSnackBar(
      BuildContext context, String message, bool isSuccess) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor:
          isSuccess ? Colors.green : Color.fromARGB(255, 137, 36, 27),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
