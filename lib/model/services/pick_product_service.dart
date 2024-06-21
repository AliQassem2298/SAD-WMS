// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/detail_model.dart';

class PickProductService {
  Future<DetailModel> pickProduct(
      {required int id, required String barcode}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/orders/pick/$id/$barcode/',
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}
