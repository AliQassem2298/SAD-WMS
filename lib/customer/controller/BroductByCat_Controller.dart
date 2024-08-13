// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/CategoryModel.dart';

class ProductByCategoryController extends GetxController {
  late CategoryModell categoryModel;

  void initialize(CategoryModell model) {
    categoryModel = model;
    update();
  }
}
