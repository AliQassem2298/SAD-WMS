import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/see_order_details_model.dart';

class CustomerOrderPageController extends GetxController {
  static String id = '/CustomerOrderPageController';
  SeeOrderDetailModel? seeOrderDetailModel;
  void up() {
    update();
  }
}
