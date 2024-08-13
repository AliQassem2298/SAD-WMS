// ignore_for_file: unused_local_variable, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/controller/myordercontroller.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/CardOrderMain.dart';

class ListView_MyOrder extends StatelessWidget {
  const ListView_MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final MyOrdersController controller = Get.put(MyOrdersController());

    return GetBuilder<MyOrdersController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.orders.isEmpty) {
          return const Center(
            child: Text(
              "There are no order items",
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff003A71),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.orders.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 247,
              width: 250,
              child: CardOrder(controller.orders, index),
            ),
          ),
        );
      },
    );
  }
}
