import 'package:warehouse_manegment_system/staff/model/models/locations_model.dart';
import 'package:warehouse_manegment_system/staff/model/models/product_model.dart';

class SuggestedLocationModel {
  final int shipmentDetailId;
  final ProductModel productModel;
  final int quantity;
  final List<LocationsModel> locationModel;

  SuggestedLocationModel({
    required this.shipmentDetailId,
    required this.productModel,
    required this.quantity,
    required this.locationModel,
  });

  factory SuggestedLocationModel.fromJson(jsonData) {
    return SuggestedLocationModel(
        shipmentDetailId: jsonData['shipment_detail_id'],
        productModel: ProductModel.fromJson(jsonData['product']),
        quantity: jsonData['quantity'],
        locationModel: List.from(jsonData['suggested_locations'])
            .map((e) => LocationsModel.fromJson(e))
            .toList()
        // LocationsModel.fromJson(jsonData['suggested_locations'][0]),
        );
  }
}
