import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';

class DeleteAccountService {
  Future<void> deleteAccount() async {
    await Api().delete(
      url: '$baseUrl/user/delete-my-account/',
      token: userToken,
    );
  }
}
