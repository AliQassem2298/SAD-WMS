import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/detail_model.dart';

class PutAwayProductService {
  Future<DetailModel> putAwayProduct({
    required String shipmentDetailId,
    required String locationBarcode,
    required String quantity,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/shipments/products/put-away/',
      body: {
        'shipment_detail_id': shipmentDetailId,
        'location_barcode': locationBarcode,
        'quantity': quantity
      },
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}
