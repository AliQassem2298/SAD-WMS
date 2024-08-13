import 'package:get/get.dart';
import 'package:warehouse_manegment_system/staff/model/models/order_model.dart';
import 'package:warehouse_manegment_system/staff/model/models/pick_list_for_order_detail_model.dart';

class SuggestedLocationsForOrdersPageController extends GetxController {
  static String id = '/SuggestedLocationsForOrdersPage';
  PickListForOrderDetailModel? locations;
  OrderModel? order;

  void up() {
    update();
  }
}
