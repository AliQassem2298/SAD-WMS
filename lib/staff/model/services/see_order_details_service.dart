import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/see_order_details_model.dart';

class SeeOrderDetailsService {
  Future<SeeOrderDetailModel> seeOrderDetails({required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/orders/details/$id/',
      token: sharedPreferences!.getString("token"),
    );
    return SeeOrderDetailModel.fromJson(data);
  }
}
