// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/forget_password_request_model.dart';

class ForgetPasswordRequestService {
  Future<ForgetPasswordRequestModel> forgetPasswordRequest(
      {required String email}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/password-reset/request/',
      body: {
        'email': email,
      },
    );
    return ForgetPasswordRequestModel.fromJson(data);
  }
}
