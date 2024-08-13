import 'package:get/get.dart';
import 'package:warehouse_manegment_system/staff/model/models/shipment_details_model.dart';

class PutAwayPageController extends GetxController {
  static String id = '/PutAwayPage';
  List<ShipmentDetailsModel>? products;
  void up() {
    update();
  }
}
