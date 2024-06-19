import 'package:get/get.dart';

import '../model/models/list_shipment_model.dart';

class ShipmentsPageController extends GetxController {
  static String id = '/ShipmentsPage';
  List<ListShipmentModel>? shipments;

  void up() {
    update();
  }
}
