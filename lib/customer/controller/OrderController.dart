// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/BasketModel/BasketModel.dart';
import 'package:warehouse_manegment_system/customer/Services/MrOrderServices/PostOrderServices.dart';

class OrderController extends GetxController {
  var isLoading = false.obs;
  var orderSuccess = false.obs;
  var orderMessage = ''.obs;

  void placeOrder(List<BasketItemModel> basketItems) async {
    isLoading.value = true;
    var response = await PostAddOrderService().postAddOrderService(basketItems);
    isLoading.value = false;

    if (response['success']) {
      orderSuccess.value = true;
      orderMessage.value = 'Order created successfully';
    } else {
      orderSuccess.value = false;
      orderMessage.value = response['message'];
    }

    // Display a message to the user
    Get.snackbar('Order Status', orderMessage.value);
  }
}
