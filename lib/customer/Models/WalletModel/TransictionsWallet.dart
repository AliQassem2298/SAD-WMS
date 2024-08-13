// ignore_for_file: non_constant_identifier_names, file_names

class GetTransactionModel {
  final int id;
  final CustomerModel customer;
  final String amount;
  final String transactionType;
  final String description;
  final String timestamp;

  GetTransactionModel({
    required this.id,
    required this.customer,
    required this.amount,
    required this.transactionType,
    required this.description,
    required this.timestamp,
  });

  factory GetTransactionModel.fromJson(Map<String, dynamic> jsonData) {
    return GetTransactionModel(
      id: jsonData['id'],
      customer: CustomerModel.fromJson(jsonData['customer']),
      amount: jsonData['amount'],
      transactionType: jsonData['transaction_type'],
      description: jsonData['description'],
      timestamp: jsonData['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer.toJson(),
      'amount': amount,
      'transaction_type': transactionType,
      'description': description,
      'timestamp': timestamp,
    };
  }
}

class CustomerModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;

  CustomerModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> jsonData) {
    return CustomerModel(
      id: jsonData['id'],
      username: jsonData['username'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      email: jsonData['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
  }
}
