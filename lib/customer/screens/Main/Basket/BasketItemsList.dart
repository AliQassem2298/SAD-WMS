// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/controller/basketcontroller.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Basket/basketitem.dart';

class BasketItemsList extends StatelessWidget {
  const BasketItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketController>(
      builder: (controller) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return BasketItem(
                onePiecePrice: basketItems[i].price,
                item: basketItems[i],
                i: i,
              );
            },
            childCount: basketItems.length,
          ),
        );
      },
    );
  }
}
