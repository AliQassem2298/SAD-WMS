// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/WalletModel/MyWalletMallet.dart';
import 'package:warehouse_manegment_system/customer/Services/WalletServices/MyWalletService.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Wallet/CardTextAndPrice.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Wallet/ListViewTransaction.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Wallet/SentAndReceive.dart';

import '../../../../constans.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: whitecolor,
        title: Text(
          'Wallet'.toUpperCase(),
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: darkblue),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<GetMyWalletModel>(
          future: GetMyWalletService().getMyWallet(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data found'));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CardTextAndPrice(walletModel: snapshot.data!),
                  SizedBox(
                    height: 40,
                  ),
                  SentAndReceive(),
                  SizedBox(
                    height: 40,
                  ),
                  ListViewTransaction()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
