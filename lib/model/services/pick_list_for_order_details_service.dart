import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/pick_list_for_order_detail_model.dart';

class PickListForOrderDetailService {
  Future<PickListForOrderDetailModel> pickListForOrderDetail(
      {required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/orders/pick-list/$id/',
      token: sharedPreferences!.getString("token"),
    );
    return PickListForOrderDetailModel.fromJson(data);
  }
}
