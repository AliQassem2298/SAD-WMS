// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';

class GetUserDetailsByTokenService {
  Future<UserModel> getUserDetailsByToken() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/users/my-details/',
      token: userToken,
    );
    return UserModel.fromJson(data);
  }
}
