// ignore_for_file: file_names

class ShowFavoriteModel {
  ShowFavoriteModel({
    required this.product,
  });

  final ProductModel product;

  factory ShowFavoriteModel.fromJson(Map<String, dynamic>? jsonData) {
    return ShowFavoriteModel(
      product: ProductModel.fromJson(jsonData!['product']),
    );
  }
}

class ProductModel {
  final int id, supplier, category;
  final String name, description, size;
  final String price, photo, barcode;

  ProductModel({
    required this.id,
    required this.name,
    required this.barcode,
    required this.category,
    required this.supplier,
    required this.price,
    required this.photo,
    required this.size,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic>? jsonData) {
    return ProductModel(
      id: jsonData!['id'] ?? 0,
      name: jsonData['name'] ?? '',
      barcode: jsonData['barcode'] ?? '',
      category: jsonData['category'] ?? 0,
      supplier: jsonData['supplier'] ?? 0,
      price: jsonData['price'] ?? '',
      photo: jsonData['photo'] ?? '',
      size: jsonData['size'] ?? '',
      description: jsonData['description'] ?? '',
    );
  }
}
