import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';

class ShipmentDetailsService {
  Future<List<ShipmentDetailsModel>> shipmentDetails({required int id}) async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/shipments/details/$id/',
      token: sharedPreferences!.getString("token"),
    );

    //// you can use the for loop
    // List<ShipmentDetailsModel> shipmenDetailstList = [];
    // for (int i = 0; i < data.length; i++) {
    //   shipmenDetailstList.add(
    //     ShipmentDetailsModel.fromJson(data[i]),
    //   );
    // }
    // return shipmenDetailstList;
    //// or the using Dart’s built in map function
    return data.map((item) => ShipmentDetailsModel.fromJson(item)).toList();
  }
}
