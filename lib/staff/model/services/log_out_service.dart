// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/detail_model.dart';

class LogoutService {
  Future<DetailModel> logOut() async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/logout/',
      token: sharedPreferences!.getString("token"),
    );
    return DetailModel.fromJson(data);
  }
}