// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/ShowDetailsOrder.dart';
import 'package:warehouse_manegment_system/customer/Services/MrOrderServices/DeleteOrderServices.dart';
import 'package:warehouse_manegment_system/main.dart';

import '../../constans.dart';
import 'myordercontroller.dart';

class OrderStatusController extends GetxController {
  final GetOrderDetailsModel data;
  String orderStatus = '';

  OrderStatusController(this.data);

  @override
  void onInit() {
    super.onInit();
    orderStatus = data.status;
  }

  Future<void> cancelOrder(BuildContext context, int orderId) async {
    final service = DeleteOrderService();
    final result = await service.deleteOrder(
        id: orderId, token: sharedPreferences!.getString("token")!);

    if (result['success']) {
      orderStatus = 'cancelled';
      if (Get.isRegistered<MyOrdersController>()) {
        Get.find<MyOrdersController>().updateOrderStatus(orderId, 'cancelled');
        update();
      }
      if (Get.isSnackbarOpen == false) {
        Get.snackbar(
          'Success',
          'Order cancelled successfully',
          backgroundColor: darkblue,
          colorText: Colors.white,
          borderRadius: 10,
          borderColor: Colors.white,
          borderWidth: 4,
        );
      }
      update();
    } else {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar(
          'Error',
          result['message'] ?? 'An error occurred',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          borderColor: Colors.white,
          borderWidth: 2,
          snackPosition: SnackPosition.BOTTOM,
          mainButton: TextButton(
            child: const Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              cancelOrder(context, orderId);
            },
          ),
        );
      }
    }
  }
}
