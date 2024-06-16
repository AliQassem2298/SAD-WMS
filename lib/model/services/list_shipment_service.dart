import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/list_shipment_model.dart';

class ListShipmentService {
  Future<List<ListShipmentModel>> listShipment() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/shipments/',
      token: sharedPreferences!.getString("token"),
    );
    // List<ListShipmentModel> shipmentList = [];
    // for (int i = 0; i < data.length; i++) {
    //   shipmentList.add(
    //     ListShipmentModel.fromJson(data[i]),
    //   );
    // }
    // return shipmentList;
    return data.map((item) => ListShipmentModel.fromJson(item)).toList();
  }
}
