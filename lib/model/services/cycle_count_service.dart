import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';

class CycleCountService {
  Future<DetailModel> cycleCount({
    required String productBarcode,
    required String locationBarcode,
    required int countedQuantity,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/inventory/cycle-count/',
      body: {
        "product_barcode": productBarcode,
        "location_barcode": locationBarcode,
        "counted_quantity": countedQuantity,
      },
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}
