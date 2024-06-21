import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';

class AssignOrderToDeliveryManService {
  Future<DetailModel> assignOrderToDeliveryMan({
    required String deliveryCompany,
    required String deliveryManName,
    required String deliveryManPhone,
    required List<int> ordersIds,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/orders/assign-delivery-man/',
      body: {
        "delivery_company": deliveryCompany,
        "delivery_man_name": deliveryManName,
        "delivery_man_phone": deliveryManPhone,
        "orders": ordersIds
      },
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}
