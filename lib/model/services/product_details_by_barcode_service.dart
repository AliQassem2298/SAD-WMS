import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/product_details_by_barcode_model.dart';

class ProductDetailsByBarcodeService {
  Future<ProductDetailsByBarcodeModel> productDetailsByBarcode({
    required String productBarcode,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/products/1234567890125/details/',
      token: sharedPreferences!.getString("token"),
    );
    return ProductDetailsByBarcodeModel.fromJson(data);
  }
}
