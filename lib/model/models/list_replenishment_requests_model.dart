import 'package:warehouse_manegment_system/model/models/product_model.dart';

class ListReplenishmentRequestsModel {
  final int id;
  final ProductModel productModel;
  final int quantity;
  final String status;
  final String reason;
  final DateTime timestamp;
  final int location;
  ListReplenishmentRequestsModel({
    required this.id,
    required this.productModel,
    required this.quantity,
    required this.status,
    required this.reason,
    required this.timestamp,
    required this.location,
  });
  factory ListReplenishmentRequestsModel.fromJson(jsonData) {
    return ListReplenishmentRequestsModel(
      id: jsonData['id'],
      productModel: ProductModel.fromJson(jsonData['product']),
      quantity: jsonData['quantity'],
      status: jsonData['status'],
      reason: jsonData['reason'],
      timestamp: DateTime.parse(jsonData['timestamp']),
      location: jsonData['location'],
    );
  }
}
