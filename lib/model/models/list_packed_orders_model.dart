class ListPackedOrdersModel {
  final int id;
  final String totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deliveredAt;
  final String priority;
  final String status;
  final int customer;

  ListPackedOrdersModel({
    required this.id,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveredAt,
    required this.priority,
    required this.status,
    required this.customer,
  });

  factory ListPackedOrdersModel.fromJson(jsonData) {
    return ListPackedOrdersModel(
      id: jsonData['id'],
      totalPrice: jsonData['total_price'],
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
      deliveredAt: jsonData['delivered_at'] != null
          ? DateTime.parse(jsonData['delivered_at'])
          : null,
      priority: jsonData['priority'],
      status: jsonData['status'],
      customer: jsonData['customer'],
    );
  }
}
