import 'package:warehouse_manegment_system/model/models/customer_model.dart';
import 'package:warehouse_manegment_system/model/models/order_model.dart';

class SeeOrderDetailModel {
  final int id;
  final CustomerModel customerModel;
  final String totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deliveredAt;
  final String priority;
  final String status;
  final List<OrderModel> details;

  SeeOrderDetailModel({
    required this.id,
    required this.customerModel,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveredAt,
    required this.priority,
    required this.status,
    required this.details,
  });

  factory SeeOrderDetailModel.fromJson(jsonData) {
    return SeeOrderDetailModel(
      id: jsonData['id'],
      customerModel: CustomerModel.fromJson(jsonData['customer']),
      totalPrice: jsonData['total_price'],
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
      deliveredAt: jsonData['delivered_at'] != null
          ? DateTime.parse(jsonData['delivered_at'])
          : null,
      priority: jsonData['priority'],
      status: jsonData['status'],
      details: List<OrderModel>.from(
        jsonData['details'].map(
          (detail) => OrderModel.fromJson(detail),
        ),
      ),
    );
  }
}
