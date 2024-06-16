import 'package:warehouse_manegment_system/model/models/product_model.dart';

class ShipmentDetailsModel {
  final int id;
  final int shipment;
  final ProductModel product;
  final String priceAtShipment;
  final int quantity;
  final String status;

  ShipmentDetailsModel({
    required this.id,
    required this.shipment,
    required this.product,
    required this.priceAtShipment,
    required this.quantity,
    required this.status,
  });

  factory ShipmentDetailsModel.fromJson(jsonData) {
    return ShipmentDetailsModel(
      id: jsonData['id'],
      shipment: jsonData['shipment'],
      product: ProductModel.fromJson(jsonData['product']),
      priceAtShipment: jsonData['price_at_shipment'],
      quantity: jsonData['quantity'],
      status: jsonData['status'],
    );
  }
}
