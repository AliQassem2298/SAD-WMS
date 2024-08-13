// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/WalletModel/MyWalletMallet.dart';

import '../../../../constans.dart';

class CardTextAndPrice extends StatelessWidget {
  final GetMyWalletModel walletModel;

  const CardTextAndPrice({
    required this.walletModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.grey.shade100,
        borderOnForeground: true,
        elevation: 15,
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(walletModel.customer.firstName,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: blackcolor)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(walletModel.customer.lastName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: blackcolor)),
                  ],
                ),
              ),
              Text(walletModel.customer.username,
                  style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('\$',
                        style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.w500,
                            color: Colors.red)),
                  ),
                  Text(walletModel.balance,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: darkblue)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
