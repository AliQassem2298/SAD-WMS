// ignore_for_file: missing_required_param, non_constant_identifier_names

import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/sign_in_model.dart';

class SignInService {
  /// شوق البيانات اذا
  /// required
  /// ...او لا من علي ....
  Future<SignInModel> SignIn(
      {required String usernameOrEmail, required String password}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/login/',
      body: {
        'username_or_email': usernameOrEmail,
        'password': password,
      },
    );

    return SignInModel.fromJson(data);
  }
}
