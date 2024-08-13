// ignore_for_file: file_names, missing_required_param, unused_local_variable, non_constant_identifier_names

import 'package:warehouse_manegment_system/main.dart';

import '../../../staff/model/helper/api.dart';
import '../../Models/WalletModel/TransictionsWallet.dart';

class GetTransactionService {
  Future<List<GetTransactionModel>> getTransaction() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/wallets/my-transactions/',
      token: sharedPreferences!.getString("token"),
    );

    List<GetTransactionModel> TransactionLists = [];
    for (int i = 0; i < data.length; i++) {
      TransactionLists.add(GetTransactionModel.fromJson(data[i]));
    }
    return TransactionLists;
  }
}
