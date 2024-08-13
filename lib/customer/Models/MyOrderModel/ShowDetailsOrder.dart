// // ignore_for_file: file_names, non_constant_identifier_names
// class GetOrderDetailsModel {
//   final int id;
//   final CustomerModel customer;
//   final String total_price, created_at, updated_at;
//   final String? delivered_at;
//   final String priority, status;
//   final DetailsModel details;
//   GetOrderDetailsModel({
//     required this.id,
//     required this.customer,
//     required this.total_price,
//     required this.created_at,
//     required this.updated_at,
//     required this.delivered_at,
//     required this.priority,
//     required this.status,
//     required this.details,
//   });
//   factory GetOrderDetailsModel.fromJson(JsonData) {
//     return GetOrderDetailsModel(
//       details: DetailsModel.fromJson(JsonData['details']),
//       id: JsonData['id'],
//       created_at: JsonData['created_at'],
//       total_price: JsonData['total_price'],
//       customer: CustomerModel.fromJson(JsonData['customer']),
//       updated_at: JsonData['updated_at'],
//       delivered_at: JsonData['delivered_at'] ?? "",
//       priority: JsonData['priority'],
//       status: JsonData['status'],
//     );
//   }
// }

// class CustomerModel {
//   CustomerModel({
//     required this.id,
//     required this.username,
//     required this.first_name,
//     required this.last_name,
//     required this.email,
//   });
//   final int id;
//   final String username, first_name, last_name, email;
//   factory CustomerModel.fromJson(jsonData) {
//     return CustomerModel(
//       id: jsonData['id'],
//       username: jsonData['username'],
//       first_name: jsonData['first_name'],
//       last_name: jsonData['last_name'],
//       email: jsonData['email'],
//     );
//   }
// }

// class DetailsModel {
//   final int id, order, quantity;
//   final String price_at_sale, status;
//   final List<ProductModel> product;
//   DetailsModel({
//     required this.order,
//     required this.id,
//     required this.price_at_sale,
//     required this.quantity,
//     required this.status,
//     required this.product,
//   });
//   factory DetailsModel.fromJson(JsonData) {
//     return DetailsModel(
//       id: JsonData['id'],
//       order: JsonData['order'],
//       quantity: JsonData['quantity'],
//       status: JsonData['status'],
//       price_at_sale: JsonData['price_at_sale'],
//       product: (JsonData['product'] as List<dynamic>)
//           .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

// class ProductModel {
//   final int id;
//   final String supplier;
//   final String category;
//   final String name, description, size;
//   final String price, photo, barcode;
//   ProductModel(
//       {required this.category,
//       required this.id,
//       required this.name,
//       required this.barcode,
//       required this.supplier,
//       required this.price,
//       required this.photo,
//       required this.size,
//       required this.description});
//   factory ProductModel.fromJson(JsonData) {
//     return ProductModel(
//       id: JsonData['id'],
//       name: JsonData['name'],
//       barcode: JsonData['barcode'],
//       category: JsonData['category'],
//       supplier: JsonData['supplier'],
//       price: JsonData['price'],
//       photo: JsonData['photo'],
//       size: JsonData['size'],
//       description: JsonData['description'],
//     );
//   }
// }

// ignore_for_file: file_names

class GetOrderDetailsModel {
  final int id;
  final CustomerModel customer;
  final String totalPrice;
  final String createdAt;
  final String updatedAt;
  final String? deliveredAt;
  final String priority;
  final String status;
  final List<DetailsModel> details;

  GetOrderDetailsModel({
    required this.id,
    required this.customer,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveredAt,
    required this.priority,
    required this.status,
    required this.details,
  });

  factory GetOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return GetOrderDetailsModel(
      id: json['id'],
      customer: CustomerModel.fromJson(json['customer']),
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deliveredAt: json['delivered_at'],
      priority: json['priority'],
      status: json['status'],
      details: (json['details'] as List<dynamic>)
          .map((e) => DetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer.toJson(),
      'total_price': totalPrice,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'delivered_at': deliveredAt,
      'priority': priority,
      'status': status,
      'details': details.map((e) => e.toJson()).toList(),
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

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
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

class DetailsModel {
  final int id;
  final ProductModel product;
  final String priceAtSale;
  final int quantity;
  final String status;
  final int order;

  DetailsModel({
    required this.id,
    required this.product,
    required this.priceAtSale,
    required this.quantity,
    required this.status,
    required this.order,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      priceAtSale: json['price_at_sale'],
      quantity: json['quantity'],
      status: json['status'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'price_at_sale': priceAtSale,
      'quantity': quantity,
      'status': status,
      'order': order,
    };
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String size;
  final String price;
  final String barcode;
  final String photo;
  final int category;
  final int supplier;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.size,
    required this.price,
    required this.barcode,
    required this.photo,
    required this.category,
    required this.supplier,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      size: json['size'],
      price: json['price'],
      barcode: json['barcode'],
      photo: json['photo'],
      category: json['category'],
      supplier: json['supplier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'size': size,
      'price': price,
      'barcode': barcode,
      'photo': photo,
      'category': category,
      'supplier': supplier,
    };
  }
}
