import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/list_packed_orders_model.dart';

class ListPackedOrdersService {
  Future<List<ListPackedOrdersModel>> listPackedOrders() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/orders/packed/',
      token: sharedPreferences!.getString("token"),
    );
    return data.map((item) => ListPackedOrdersModel.fromJson(item)).toList();
  }
}
