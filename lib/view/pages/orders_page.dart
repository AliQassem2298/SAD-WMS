import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersPageController>(
      init: OrdersPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Orders Page'),
          ),
        );
      },
    );
  }
}
