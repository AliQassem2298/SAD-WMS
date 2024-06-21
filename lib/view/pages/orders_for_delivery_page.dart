import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/orders_for_delivery_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';
import 'package:warehouse_manegment_system/model/services/list_packed_orders_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_card_orders_for_delivery.dart';

class OrdersForDeliveryPage extends StatelessWidget {
  const OrdersForDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersForDeliveryPageController>(
      init: OrdersForDeliveryPageController(),
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
              'Orders For Delivery Page',
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
                future: ListPackedOrdersService().listPackedOrders(),
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
                          return CustomOrdersForDeliveryCard(
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
