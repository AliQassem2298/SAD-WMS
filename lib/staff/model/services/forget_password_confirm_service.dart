// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/forget_password_request_model.dart';

class ForgetPasswordConfirmService {
  Future<ForgetPasswordRequestModel> forgetPasswordConfirm({
    required String email,
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/password-reset/confirm/',
      body: {
        "email": email,
        "code": code,
        "password": password,
        "confirm_password": confirmPassword,
      },
    );
    return ForgetPasswordRequestModel.fromJson(data);
  }
}
