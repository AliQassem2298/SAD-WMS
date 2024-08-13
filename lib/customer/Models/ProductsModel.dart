// ignore_for_file: file_names, non_constant_identifier_names

import 'package:warehouse_manegment_system/customer/Models/CategoryModel.dart';

class GetProductsModel {
  final int id;
  final SupplierModel supplier;
  final CategoryModell category;
  final String name, description, size;
  final String price, photo, barcode;
  GetProductsModel(
      {required this.category,
      required this.id,
      required this.name,
      required this.barcode,
      required this.supplier,
      required this.price,
      required this.photo,
      required this.size,
      required this.description});
  factory GetProductsModel.fromJson(JsonData) {
    return GetProductsModel(
      id: JsonData['id'],
      name: JsonData['name'],
      barcode: JsonData['barcode'],
      category: CategoryModell.fromJson(JsonData['category']),
      supplier: SupplierModel.fromJson(JsonData['supplier']),
      price: JsonData['price'],
      photo: JsonData['photo'],
      size: JsonData['size'],
      description: JsonData['description'],
    );
  }
}

class SupplierModel {
  SupplierModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
    required this.phone,
    required this.contact_person,
  });
  final int id;
  final String name, photo, phone, contact_person, email;
  factory SupplierModel.fromJson(jsonData) {
    return SupplierModel(
        id: jsonData['id'],
        name: jsonData['name'],
        phone: jsonData['phone'],
        photo: jsonData['photo'],
        contact_person: jsonData['contact_person'],
        email: jsonData['email']);
  }
}
