// ignore_for_file: non_constant_identifier_names, file_names

class GetMyWalletModel {
  final int id;
  final CustomerModel customer;
  final String balance;

  GetMyWalletModel({
    required this.id,
    required this.customer,
    required this.balance,
  });

  factory GetMyWalletModel.fromJson(Map<String, dynamic> jsonData) {
    return GetMyWalletModel(
      id: jsonData['id'],
      customer: CustomerModel.fromJson(jsonData['customer']),
      balance: jsonData['balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer.toJson(),
      'balance': balance,
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
