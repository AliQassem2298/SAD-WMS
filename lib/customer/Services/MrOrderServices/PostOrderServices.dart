// ignore_for_file: avoid_print, file_names

import 'dart:convert';

import 'package:warehouse_manegment_system/customer/Models/BasketModel/BasketModel.dart';
import 'package:warehouse_manegment_system/main.dart';

import '../../../staff/model/helper/api.dart';

class PostAddOrderService {
  Future<Map<String, dynamic>> postAddOrderService(
      List<BasketItemModel> basketItems) async {
    List<Map<String, dynamic>> main = basketItems
        .map((e) => {"product": e.id, "quantity": e.counter})
        .toList();

    try {
      var response = await Api().post(
        token: sharedPreferences!.getString("token"),
        url: '$baseUrl/orders/create/',
        body: jsonEncode({"products": main}),
      );

      if (response == null) {
        print('Error: Response is null');
        return {"success": false, "message": 'Response is null'};
      }

      if (response['success'] == false) {
        print('Error: ${response['message']}');
        return {"success": false, "message": response['message']};
      }

      print('Order created successfully');
      return {"success": true, "data": response};
    } catch (e) {
      print('Request failed with error: $e');
      return {"success": false, "message": 'Request failed with error: $e'};
    }
  }
}
