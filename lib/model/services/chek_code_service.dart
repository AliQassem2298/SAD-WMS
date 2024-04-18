import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/logout_model.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';

class CheckCodeService {
  Future<LogoutModel> checkCode(
      {required String email, required String code}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/password-reset/code-check/',
      body: {
        "email": email,
        "code": code,
      },
      token: userToken,
    );
    return LogoutModel.fromJson(data);
  }
}
