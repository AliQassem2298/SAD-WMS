import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';

class OrdersForDeliveryPageController extends GetxController {
  static String id = '/OrdersForDeliveryPageController';
  List<ListAllOrdersModel>? orders;

  void up() {
    update();
  }
}
