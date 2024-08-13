// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/WalletModel/MyWalletMallet.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Wallet/WalletPage.dart';

import '../../../constans.dart';

class IconsHomePage extends StatelessWidget {
  const IconsHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WalletPage(),
                  settings: RouteSettings(
                    arguments:
                        GetMyWalletModel, // Replace with your actual instance of GetMyWalletModel
                  ),
                ),
              );
            },
            icon: const Icon(Icons.move_down_rounded),
            color: darkblue.withOpacity(0.9),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
