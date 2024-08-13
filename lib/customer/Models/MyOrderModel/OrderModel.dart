// ignore_for_file: file_names, non_constant_identifier_names
class GetOrdermodel {
  final int id;
  final CustomerModel customer;
  final String total_price, created_at, updated_at;
  final String? delivered_at;
  final String priority;
  String status;
  GetOrdermodel(
      {required this.id,
      required this.customer,
      required this.total_price,
      required this.created_at,
      required this.updated_at,
      required this.delivered_at,
      required this.priority,
      required this.status});
  factory GetOrdermodel.fromJson(JsonData) {
    return GetOrdermodel(
      id: JsonData['id'],
      created_at: JsonData['created_at'],
      total_price: JsonData['total_price'],
      customer: CustomerModel.fromJson(JsonData['customer']),
      updated_at: JsonData['updated_at'],
      delivered_at: JsonData['delivered_at'] ?? "",
      priority: JsonData['priority'],
      status: JsonData['status'],
    );
  }
}

class CustomerModel {
  CustomerModel({
    required this.id,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
  });
  final int id;
  final String username, first_name, last_name, email;
  factory CustomerModel.fromJson(jsonData) {
    return CustomerModel(
      id: jsonData['id'],
      username: jsonData['username'],
      first_name: jsonData['first_name'],
      last_name: jsonData['last_name'],
      email: jsonData['email'],
    );
  }
}
