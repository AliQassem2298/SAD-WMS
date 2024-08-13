import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/OrderModel.dart';
import 'package:warehouse_manegment_system/customer/Services/MrOrderServices/GetShowOrderServices.dart';

class MyOrdersController extends GetxController {
  List<GetOrdermodel> orders = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() async {
    isLoading = true;
    update();
    var fetchedOrders = await GetShowOrder().getShowOrder();
    orders = fetchedOrders;
    isLoading = false;
    update();
  }

  void updateOrderStatus(int orderId, String status) {
    var order = orders.firstWhere((order) => order.id == orderId);
    order.status = status;
    update();
  }

  void up() {
    update();
  }
}
