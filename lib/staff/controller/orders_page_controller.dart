import 'package:get/get.dart';
import 'package:warehouse_manegment_system/staff/model/models/list_all_orders_model.dart';

class OrdersPageController extends GetxController {
  static String id = '/OrdersPage';
  List<ListAllOrdersModel>? orders;
  void up() {
    update();
  }
}
