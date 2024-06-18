import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';

class PutAwayProductService {
  Future<DetailsModel> putAwayProduct({
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
    return DetailsModel.fromJson(data);
  }
}
