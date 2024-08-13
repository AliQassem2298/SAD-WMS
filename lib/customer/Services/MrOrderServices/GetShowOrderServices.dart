// ignore_for_file: file_names

import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/OrderModel.dart';
import 'package:warehouse_manegment_system/main.dart';

import '../../../staff/model/helper/api.dart';

class GetShowOrder {
  Future<List<GetOrdermodel>> getShowOrder() async {
    List<dynamic> data = await Api()
        // ignore: missing_required_param
        .get(
      url: '$baseUrl/orders/my-orders/',
      token: sharedPreferences!.getString("token"),
    );
    List<GetOrdermodel> showorderList = [];

    for (int i = 0; i < data.length; i++) {
      showorderList.add(
        GetOrdermodel.fromJson(data[i]),
      );
    }

    return showorderList;
  }
}
