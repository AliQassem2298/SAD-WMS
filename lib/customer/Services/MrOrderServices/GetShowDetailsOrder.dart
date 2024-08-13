// ignore_for_file: file_names, missing_required_param

import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/ShowDetailsOrder.dart';
import 'package:warehouse_manegment_system/main.dart';

import '../../../staff/model/helper/api.dart';

class GetShowOrderDetails {
  Future<GetOrderDetailsModel> getShowOrderDetails({
    required int orderId,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/orders/details/$orderId/',
      token: sharedPreferences!.getString("token")!,
    );
    return GetOrderDetailsModel.fromJson(data);
  }
}
