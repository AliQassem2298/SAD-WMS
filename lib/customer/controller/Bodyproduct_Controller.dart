// ignore_for_file: file_names, camel_case_types
import 'package:get/get.dart';

import '../Models/BasketModel/BasketModel.dart';
import '../Models/ProductsModel.dart';

class Product_Body_Controller extends GetxController {
  var basketItems = <BasketItemModel>[].obs;
  var basketItemsPlaceOrderList1 = <Map<String, dynamic>>[].obs;

  void toggleItemInBasket(GetProductsModel product) {
    var elementToCheck = {
      'quantity': 1,
      'product_id': product.id,
    };

    bool isContained = basketItemsPlaceOrderList1.any((item) =>
        item['quantity'] == elementToCheck['quantity'] &&
        item['product_id'] == elementToCheck['product_id']);

    if (isContained) {
      basketItemsPlaceOrderList1.removeWhere((item) =>
          item['quantity'] == elementToCheck['quantity'] &&
          item['product_id'] == elementToCheck['product_id']);
      basketItems.removeWhere((item) => item.name == product.name);
    } else {
      basketItemsPlaceOrderList1.add(elementToCheck);
      basketItems.add(BasketItemModel(
        id: product.id,
        name: product.name,
        price: num.parse(product.price),
        image: product.photo,
        counter: 1,
      ));
    }

    update();
  }

  bool isItemInBasket(GetProductsModel product) {
    return basketItemsPlaceOrderList1.any(
        (item) => item['quantity'] == 1 && item['product_id'] == product.id);
  }

  void up() {
    update();
  }
}
