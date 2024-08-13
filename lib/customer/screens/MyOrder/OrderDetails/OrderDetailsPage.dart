// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/OrderDetails/ListViewOrderDetails.dart';

import '../../../../constans.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
              color: darkblue, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: darkblue,
              ),
            )),
      ),
      body: SingleChildScrollView(child: ListViewOrderDetails(orderid: id)),
    );
  }
}
