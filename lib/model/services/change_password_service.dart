import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';

class ChangePasswordService {
  Future<DetailsModel> changePassword({
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
      token: sharedPreferences!.getString("token"),
    );
    return DetailsModel.fromJson(data);
  }
}
