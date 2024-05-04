import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/customers_order_page_controller.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_orders_card.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_shipment_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersPageController>(
      init: OrdersPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFB0BEC5),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: kSecondtColor,
            title: Text(
              'Orders Page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(CustomerOrderPageController.id);

                    // Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomOrdersCard(
                    customerName: 'Ali',
                    status: 'pending',
                    image: 'assets/clock icon.png',
                    praiority: 'High',
                    totalPrice: r'20$',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(CustomerOrderPageController.id);
                    // Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomOrdersCard(
                    customerName: 'Ali',
                    status: 'pending',
                    image: 'assets/box icon.png',
                    praiority: 'High',
                    totalPrice: r'20$',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(CustomerOrderPageController.id);

                    // Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomOrdersCard(
                    customerName: 'Ali',
                    status: 'pending',
                    image: 'assets/true icon.png',
                    praiority: 'Low',
                    totalPrice: r'20$',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // InkWell(
                //   onTap: () {},
                //   child: CustomShipmentCard(
                //     supplierName: 'Ali',
                //     status: 'pending',
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
