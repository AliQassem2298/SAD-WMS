import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/details_model.dart';

class CheckCodeService {
  Future<DetailsModel> checkCode(
      {required String email, required String code}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/password-reset/code-check/',
      body: {
        "email": email,
        "code": code,
      },
      token: sharedPreferences!.getString("token"),
    );
    return DetailsModel.fromJson(data);
  }
}
