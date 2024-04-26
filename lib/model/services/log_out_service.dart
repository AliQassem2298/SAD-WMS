// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';

class LogoutService {
  Future<DetailsModel> logOut() async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/logout/',
      token: sharedPreferences!.getString("token"),
    );
    return DetailsModel.fromJson(data);
  }
}
