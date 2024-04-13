// ignore_for_file: missing_required_param

import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';

class GetUserDetailsByIdService {
  Future<UserModel> getUserDetailsById({required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/users/$id/',
    );

    return UserModel.fromJson(data);
  }
}
