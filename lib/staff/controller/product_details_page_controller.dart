import 'package:get/get.dart';
import 'package:warehouse_manegment_system/staff/model/models/product_details_by_barcode_model.dart';

class ProductDetailsPageController extends GetxController {
  static String id = '/productDetailsPage';
  ProductDetailsByBarcodeModel? productDetails;

  bool animated = false;
  bool isVisible = false;

  // String? email;
  // String? password;

  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    update();
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    update();
  }
}
