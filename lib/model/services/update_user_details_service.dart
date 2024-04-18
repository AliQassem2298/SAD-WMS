// ignore_for_file: avoid_print

import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/logout_model.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';

class UpdateUserDetailsService {
  Future<LogoutModel> userUpdateDetails({
    required String? firstName,
    required String? lastName,
    required String? userName,
    required String? email,
  }) async {
    // Map<String, dynamic> body = {};
    // if (firstName != null) {
    //   body.addAll({"first_name": firstName});
    //   print(firstName);
    // }
    // if (firstName != null) {
    //   body.addAll({"last_name": lastName});
    //   print(lastName);
    // }
    // if (firstName != null) {
    //   body.addAll({"username": userName});
    //   print(userName);
    // }
    // if (firstName != null) {
    //   body.addAll({"email": email});
    //   print(email);
    // }
    Map<String, dynamic> data = await Api().put(
      url: '$baseUrl/user/update-info/',
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "username": userName,
        "email": email,
      },
      token: userToken,
    );
    return LogoutModel.fromJson(data);
  }
}
