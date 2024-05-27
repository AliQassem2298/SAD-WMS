import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
// import 'package:warehouse_manegment_system/model/models/details_model.dart';

class DisableAccountService {
  Future<void> disableAccount({required String password}) async {
    await Api().delete(
      body: {
        'password': password,
      },
      url: '$baseUrl/user/disable-my-account/',
      token: sharedPreferences!.getString("token"),
    );
    // return DetailsModel.fromJson(data);
  }
}
