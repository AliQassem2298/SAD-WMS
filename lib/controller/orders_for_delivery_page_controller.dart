import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';

class OrdersForDeliveryPageController extends GetxController {
  static String id = '/OrdersForDeliveryPageController';
  List<ListAllOrdersModel>? orders;
  var selectedOrderIds = <int>[];

  void toggleSelection(int orderId) {
    if (selectedOrderIds.contains(orderId)) {
      selectedOrderIds.remove(orderId);
    } else {
      selectedOrderIds.add(orderId);
    }
    update();
  }

  void up() {
    update();
  }
}
