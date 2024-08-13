// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:warehouse_manegment_system/customer/screens/Favourite/ListViewFavourite.dart';
import 'package:warehouse_manegment_system/customer/screens/Favourite/TopFavouritePage.dart';

import '../../../constans.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkblue,
        title: const Text(
          'Favourite',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
                onPressed: () {
                  Get.to(() => const TopFavourite());
                },
                icon: const Icon(Icons.favorite_border)),
          )
        ],
      ),
      body: ListView_Favourite(),
    );
  }
}
