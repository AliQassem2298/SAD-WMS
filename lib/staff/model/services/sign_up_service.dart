// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/staff/model/helper/api.dart';
import 'package:warehouse_manegment_system/staff/model/models/detail_model.dart';

class SignUpService {
  Future<DetailModel> signUp({
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
    return DetailModel.fromJson(data);
  }
}
