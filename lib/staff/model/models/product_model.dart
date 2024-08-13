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

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        name: jsonData['name'],
        description: jsonData['description'],
        size: jsonData['size'],
        price: jsonData['price'],
        barcode: jsonData['barcode'],
        photo: jsonData['photo'],
        category: jsonData['category'],
        supplier: jsonData['supplier']);
  }
}
