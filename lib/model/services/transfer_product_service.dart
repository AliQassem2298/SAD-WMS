import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';

class TransferProductService {
  Future<DetailModel> trasferProduct({
    required String productBarcode,
    required String fromLocationBarcode,
    required String toLocationBarcode,
    required int quantity, ///////////it is int in the postman
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/inventory/transfer/',
      body: {
        "product_barcode": productBarcode,
        "from_location_barcode": fromLocationBarcode,
        "to_location_barcode": toLocationBarcode,
        "quantity": quantity
      },
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}
