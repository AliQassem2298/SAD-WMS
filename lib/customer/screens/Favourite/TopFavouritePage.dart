// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/screens/Favourite/ListView_Topfav.dart';

class TopFavourite extends StatelessWidget {
  const TopFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkblue,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Top 10 Favourite',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: const ListView_TopFavourite(),
    );
  }
}
