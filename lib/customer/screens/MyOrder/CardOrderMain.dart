// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/OrderModel.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/OrderDetails/OrderDetailsPage.dart';

import '../../../constans.dart';

Card CardOrder(List<GetOrdermodel> data, int index) {
  return Card(
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    color: whitecolor,
    elevation: 10,
    margin: const EdgeInsets.symmetric(
      horizontal: 10,
      // vertical: 6,
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Id: #${data[index].id}',
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data[index].status,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: data[index].status.toLowerCase() == 'cancelled'
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Text(
                'Order Date:   ${data[index].created_at.toString().substring(0, 10)}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Text(
                'Updated at:   ${data[index].updated_at.toString().substring(0, 10)}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Text(
                'Delivered at:  ${data[index].delivered_at}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: darkblue),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(() => OrderDetailsPage(id: data[index].id));
                    },
                    child: const Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whitecolor),
                    ),
                  )),
              const Spacer(),
              Text(
                '\$ ${data[index].total_price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: darkblue),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
