import 'package:warehouse_manegment_system/staff/model/models/product_model.dart';

class OrderModel {
  final int id;
  final ProductModel productModel;
  final String priceAtSale;
  final int quantity;
  final String status;
  final int order;

  OrderModel({
    required this.id,
    required this.productModel,
    required this.priceAtSale,
    required this.quantity,
    required this.status,
    required this.order,
  });

  factory OrderModel.fromJson(jsonData) {
    return OrderModel(
      id: jsonData['id'],
      productModel: ProductModel.fromJson(jsonData['product']),
      priceAtSale: jsonData['price_at_sale'],
      quantity: jsonData['quantity'],
      status: jsonData['status'],
      order: jsonData['order'],
    );
  }
}
