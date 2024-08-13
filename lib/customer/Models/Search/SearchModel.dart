// ignore_for_file: file_names
import 'dart:convert';

String welcomeToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<Product> products;

  SearchModel({required this.products});

  factory SearchModel.fromJson(List<dynamic> json) => SearchModel(
        products: List<Product>.from(json.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final String name, description, size;
  final String price, photo, barcode;
  final Supplier supplier;
  final Category category;

  Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.price,
    required this.photo,
    required this.size,
    required this.description,
    required this.supplier,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        barcode: json['barcode'],
        price: json['price'],
        photo: json['photo'],
        size: json['size'],
        description: json['description'],
        supplier: Supplier.fromJson(json['supplier']),
        category: Category.fromJson(json['category']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photo": photo,
        "price": price,
        "size": size,
        "barcode": barcode,
        "supplier": supplier.toJson(),
        "category": category.toJson(),
      };
}

class Category {
  final int id;
  final String name, description;
  final String photo;

  Category({
    required this.photo,
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photo": photo,
      };
}

class Supplier {
  final int id;
  final String name, photo, phone, contactPerson, email;

  Supplier({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
    required this.phone,
    required this.contactPerson,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        photo: json['photo'],
        contactPerson: json['contact_person'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "photo": photo,
        "contact_person": contactPerson,
        "email": email,
      };
}
