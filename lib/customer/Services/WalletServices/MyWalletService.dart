// ignore_for_file: file_names, avoid_print, missing_required_param

import 'package:warehouse_manegment_system/customer/Models/WalletModel/MyWalletMallet.dart';
import 'package:warehouse_manegment_system/main.dart';

import '../../../staff/model/helper/api.dart';

class GetMyWalletService {
  Future<GetMyWalletModel> getMyWallet() async {
    try {
      Map<String, dynamic> data = await Api().get(
        url: '$baseUrl/wallets/my-wallet/',
        token: sharedPreferences!.getString("token"),
      );
      return GetMyWalletModel.fromJson(data);
    } catch (e) {
      print('Error fetching wallet data: $e');
      rethrow;
    }
  }
}
