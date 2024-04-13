// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/sign_up_model.dart';

class SignUpService {
  Future<SignUpModel> signUp({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: '$baseUrl/register/', body: {
      "first_name": firstName,
      "last_name": lastName,
      "username": userName,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "role": role,
    });
    return SignUpModel.fromJson(data);
  }
}
