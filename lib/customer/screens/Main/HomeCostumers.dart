// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, file_names
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/controller/HomeCostumer_Controller.dart';
import 'package:warehouse_manegment_system/customer/screens/Favourite/Favourite.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Basket/BasketPage.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Body_HomePage.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Wallet/WalletPage.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/OrderPage.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController homeController = Get.put(HomeController());

  final List<Widget> screens = [
    Favourite(),
    const MyOrder(),
    Body(),
    BasketPage(),
    WalletPage()
  ];

  final PageOptions = [
    const Text('Home'),
    const Text('My Orders'),
    const Text('Basket'),
    const Text('Favourite'),
    const Text('Wallet'),
  ];

  final List<IconData> IconOptions = [
    Icons.favorite,
    Icons.wallet_travel_rounded,
    Icons.home,
    Icons.shopping_basket_outlined,
    Icons.wallet,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Obx(() => screens[homeController.currentIndex.value]),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            index: homeController.currentIndex.value,
            height: 60.0,
            items: [
              for (int i = 0; i < PageOptions.length; i++)
                Icon(
                  IconOptions[i],
                  size: 30,
                  color: i == homeController.currentIndex.value
                      ? blackcolor
                      : Colors.white,
                ),
            ],
            color: darkblue,
            buttonBackgroundColor: darkblue,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 400),
            onTap: (index) {
              homeController.updateIndex(index);
            },
          )),
    );
  }
}
