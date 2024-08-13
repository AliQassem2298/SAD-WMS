import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/shipment_details_model.dart';

class ListRecivedProducts {
  Future<List<ShipmentDetailsModel>> listRecivedProducts() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/shipments/products/received/',
      token: sharedPreferences!.getString("token"),
    );
    return data.map((item) => ShipmentDetailsModel.fromJson(item)).toList();
  }
}
