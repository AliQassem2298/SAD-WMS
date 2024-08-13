import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/staff/model/models/list_all_orders_model.dart';
import 'package:warehouse_manegment_system/staff/model/services/list_all_orders_service.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_orders_card.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_shipment_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersPageController>(
      init: OrdersPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    kFirstColor,
                    kFirstColor2,
                  ],
                ),
              ),
            ),
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
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  kFirstColor,
                  kFirstColor2,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              child: FutureBuilder<List<ListAllOrdersModel>>(
                future: ListAllOrdersService().listAllOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                          fontSize: 6.w,
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No Orders found',
                          style: TextStyle(fontSize: 6.w),
                        ),
                      );
                    } else {
                      controller.orders = snapshot.data!;
                      return ListView.builder(
                        itemCount: controller.orders!.length,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          return CustomOrdersCard(
                            listAllOrdersModel: controller.orders![index],
                          ).paddingSymmetric(vertical: 1.h);
                        },
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

              // ListView(
              //   children: [
              //     SizedBox(
              //       height: 1.h,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Get.toNamed(CustomerOrderPageController.id);

              //         // Get.toNamed(SupplierShipmentPagController.id);
              //       },
              //       child: CustomOrdersCard(
              //         customerName: 'Ali',
              //         status: 'pending',
              //         image: 'assets/clock.jpg',
              //         praiority: 'High',
              //         totalPrice: r'20$',
              //       ),
              //     ),
              //     SizedBox(
              //       height: 2.5.h,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Get.toNamed(CustomerOrderPageController.id);
              //         // Get.toNamed(SupplierShipmentPagController.id);
              //       },
              //       child: CustomOrdersCard(
              //         customerName: 'Ali',
              //         status: 'Packed',
              //         image: 'assets/box icon.png',
              //         praiority: 'High',
              //         totalPrice: r'20$',
              //       ),
              //     ),
              //     SizedBox(
              //       height: 2.5.h,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Get.toNamed(CustomerOrderPageController.id);

              //         // Get.toNamed(SupplierShipmentPagController.id);
              //       },
              //       child: CustomOrdersCard(
              //         customerName: 'Ali',
              //         status: 'Delivered',
              //         image: 'assets/done.jpg',
              //         praiority: 'Low',
              //         totalPrice: r'20$',
              //       ),
              //     ),
              //     SizedBox(
              //       height: 2.5.h,
              //     ),

              //   ],
              // ),
          