import 'package:get/get.dart';

import '../../constans.dart';

class BasketController extends GetxController {
  var totalPrice = 0.0.obs;

  void updateTotalPrice() {
    totalPrice.value = basketItems.fold(
      0.0,
      (sum, item) => sum + item.price * item.counter,
    );
  }

  void incrementSum(num amount) {
    totalPrice.value += amount;
  }

  void decrementSum(num amount) {
    totalPrice.value -= amount;
  }

  void delete(int i) {
    var item = basketItems[i];
    decrementSum(item.price * item.counter);
    basketItems.removeAt(i);
    updateTotalPrice();
    update();
  }

  void incrementItem(int i) {
    var item = basketItems[i];
    item.counter++;
    incrementSum(item.price);
    updateTotalPrice();
    update();
  }

  void decrementItem(int i) {
    var item = basketItems[i];
    if (item.counter > 1) {
      item.counter--;
      decrementSum(item.price);
      updateTotalPrice();
      update();
    }
  }

  void clearBasket() {
    basketItems.clear();
    totalPrice.value = 0.0;
    update();
  }

  void up() {
    update();
  }
}
