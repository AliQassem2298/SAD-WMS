import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/list_all_orders_model.dart';

class ListAllOrdersService {
  Future<List<ListAllOrdersModel>> listAllOrders() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/orders/list-all/',
      token: sharedPreferences!.getString("token"),
    );
    return data.map((item) => ListAllOrdersModel.fromJson(item)).toList();
  }
}
