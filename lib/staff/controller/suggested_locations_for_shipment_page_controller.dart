import 'package:get/get.dart';
import 'package:warehouse_manegment_system/staff/model/models/suggested_locations_model.dart';

class SuggestedLocationsForShipmentPageController extends GetxController {
  static String id = '/SuggestedLocationsForShipmentPage';
  SuggestedLocationModel? locations;
  void up() {
    update();
  }
}
