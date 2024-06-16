class SupplierModel {
  final int id;
  final String name;
  final String contactPerson;
  final String email;
  final String phone;
  final String photo;

  SupplierModel({
    required this.id,
    required this.name,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.photo,
  });

  factory SupplierModel.fromJson(jsonData) {
    return SupplierModel(
      id: jsonData['id'],
      name: jsonData['name'],
      contactPerson: jsonData['contact_person'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      photo: jsonData['photo'],
    );
  }
}
