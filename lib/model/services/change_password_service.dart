import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/logout_model.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';

class ChangePasswordService {
  Future<LogoutModel> changePassword({
    required String oldPassword,
    required String password,
    required String confirmPassword,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/user/change-password/',
      body: {
        "old_password": oldPassword,
        "new_password": password,
        "confirm_new_password": confirmPassword,
      },
      token: userToken,
    );
    return LogoutModel.fromJson(data);
  }
}
