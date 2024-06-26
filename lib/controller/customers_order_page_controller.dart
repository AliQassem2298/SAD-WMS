import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';
import 'package:warehouse_manegment_system/model/models/see_order_details_model.dart';

class CustomerOrderPageController extends GetxController {
  static String id = '/CustomerOrderPageController';
  SeeOrderDetailModel? seeOrderDetailModel;
  ListAllOrdersModel? listAllOrdersModel;
  void up() {
    update();
  }
}
