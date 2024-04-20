import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';

class DeleteAccountService {
  Future<void> deleteAccount() async {
    await Api().delete(
      url: '$baseUrl/user/delete-my-account/',
      token: sharedPreferences!.getString("token"),
    );
  }
}
