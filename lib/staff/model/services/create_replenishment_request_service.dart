import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/detail_model.dart';

class CreateReplenishmentRequestService {
  Future<DetailModel> createReplenishmentRequest({
    required String productBarcode,
    required String locationBarcode,
    required int quantity,
    required String reason,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/inventory/replenishment-request/create/',
      body: {
        "product_barcode": productBarcode,
        "location_barcode": locationBarcode,
        "quantity": quantity,
        "reason": reason,
      },
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}
