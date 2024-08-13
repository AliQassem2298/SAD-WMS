import 'package:warehouse_manegment_system/staff/model/models/category_model.dart';
import 'package:warehouse_manegment_system/staff/model/models/supplier_model.dart';

class ProductDetailsByBarcodeModel {
  final int id;
  final CategoryModel categoryModel;
  final SupplierModel supplierModel;
  final String name;
  final String description;
  final String size;
  final String price;
  final String barcode;
  final String photo;

  ProductDetailsByBarcodeModel({
    required this.id,
    required this.categoryModel,
    required this.supplierModel,
    required this.name,
    required this.description,
    required this.size,
    required this.price,
    required this.barcode,
    required this.photo,
  });

  factory ProductDetailsByBarcodeModel.fromJson(jsonData) {
    return ProductDetailsByBarcodeModel(
      id: jsonData['id'],
      categoryModel: CategoryModel.fromJson(jsonData['category']),
      supplierModel: SupplierModel.fromJson(jsonData['supplier']),
      name: jsonData['name'],
      description: jsonData['description'],
      size: jsonData['size'],
      price: jsonData['price'],
      barcode: jsonData['barcode'],
      photo: jsonData['photo'],
    );
  }
}
