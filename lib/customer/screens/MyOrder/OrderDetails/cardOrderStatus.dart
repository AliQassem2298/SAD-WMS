// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/ShowDetailsOrder.dart';
import 'package:warehouse_manegment_system/customer/controller/OrderStatusController.dart';

import '../../../../constans.dart';

class OrderStatusCard extends StatelessWidget {
  final GetOrderDetailsModel data;

  const OrderStatusCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderStatusController controller =
        Get.put(OrderStatusController(data));

    return GetBuilder<OrderStatusController>(
      init: controller,
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            color: Colors.grey.shade100,
            elevation: 15,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 229, 229)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Status',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: darkblue),
                    ),
                    Row(
                      children: [
                        Text(
                          controller.orderStatus,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: controller.orderStatus.toLowerCase() ==
                                      'cancelled'
                                  ? Colors.red
                                  : Colors.grey),
                        ),
                        if (controller.orderStatus.toLowerCase() == 'pending')
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.red),
                            onPressed: () async {
                              await controller.cancelOrder(context, data.id);
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
