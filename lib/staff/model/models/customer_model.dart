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

  factory CustomerModel.fromJson(jsonData) {
    return CustomerModel(
      id: jsonData['id'],
      username: jsonData['username'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      email: jsonData['email'],
    );
  }
}
