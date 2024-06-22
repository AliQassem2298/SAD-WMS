import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/orders_for_delivery_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';
import 'package:warehouse_manegment_system/model/services/assign_order_to_delivery_man.dart';
import 'package:warehouse_manegment_system/model/services/list_packed_orders_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_card_orders_for_delivery.dart';

class OrdersForDeliveryPage extends StatelessWidget {
  const OrdersForDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        Get.arguments as Map<String, dynamic>;
    final TextEditingController textEditingController =
        arguments['textEditingController'];
    final TextEditingController deliveryMan = arguments['deliveryMan'];
    final TextEditingController phoneNumber = arguments['phoneNumber'];
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
              child: Stack(
                children: [
                  FutureBuilder<List<ListAllOrdersModel>>(
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
                              color: kWhiteColor,
                            ),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              'No Orders found',
                              style: TextStyle(
                                fontSize: 6.w,
                                color: kWhiteColor,
                              ),
                            ),
                          );
                        } else {
                          controller.orders = snapshot.data!;
                          return ListView.builder(
                            itemCount: controller.orders!.length,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              final order = controller.orders![index];
                              return CustomOrdersForDeliveryCard(
                                listAllOrdersModel: order,
                                isSelected: controller.selectedOrderIds
                                    .contains(order.id),
                                onTap: () {
                                  controller.toggleSelection(order.id);
                                },
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
                  controller.selectedOrderIds.isNotEmpty &&
                          controller.orders!.isNotEmpty
                      ? Positioned(
                          bottom: 0.h,
                          left: 0.w,
                          child: Container(
                            height: 13.h,
                            width: 100.w,
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 3.h,
                            ),
                            child: Column(
                              children: [
                                CustomButton(
                                  hasBorder: true,
                                  onPressed: () async {
                                    try {
                                      DetailModel response =
                                          await AssignOrderToDeliveryManService()
                                              .assignOrderToDeliveryMan(
                                        deliveryCompany:
                                            textEditingController.text,
                                        deliveryManName: deliveryMan.text,
                                        deliveryManPhone: phoneNumber.text,
                                        ordersIds: controller.selectedOrderIds,
                                      );
                                      controller.clearOrders();
                                      print('Success');

                                      Get.snackbar(
                                        '',
                                        response.toString(),
                                      );
                                    } catch (e) {
                                      print(e.toString());
                                      Get.snackbar(
                                        'Error',
                                        e.toString(),
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                  text: 'Submit',
                                  fontSize: 7.w,
                                  textColor: kFirstColor,
                                  gradient: const LinearGradient(
                                    colors: [
                                      kWhiteColor,
                                      kWhiteColor,
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
