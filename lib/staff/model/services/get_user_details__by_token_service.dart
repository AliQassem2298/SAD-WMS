// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/user_model.dart';

class GetUserDetailsByTokenService {
  Future<UserModel> getUserDetailsByToken() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/users/my-details/',
      token: sharedPreferences!.getString("token"),
    );
    return UserModel.fromJson(data);
  }
}
