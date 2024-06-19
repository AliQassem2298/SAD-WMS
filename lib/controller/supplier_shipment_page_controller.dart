import 'package:get/get.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';

class SupplierShipmentPagController extends GetxController {
  static String id = '/SupplierShipmentPage';
  List<ShipmentDetailsModel>? products;

  void up() {
    update();
  }
}
