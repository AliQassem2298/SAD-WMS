// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_manegment_system/customer/Models/WalletModel/TransictionsWallet.dart';
import 'package:warehouse_manegment_system/customer/Services/WalletServices/TransactionService.dart';

import '../../../../constans.dart'; // Import intl package

class ListViewTransaction extends StatelessWidget {
  const ListViewTransaction({super.key});

  Future<List<GetTransactionModel>> _fetchTransactions() async {
    final GetTransactionService service = GetTransactionService();
    return await service.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Text('Transaction history',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          FutureBuilder<List<GetTransactionModel>>(
            future: _fetchTransactions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No transactions available.'));
              } else {
                final transactions = snapshot.data!;
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height *
                        0.8, // Adjust the height as needed
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      // Determine the color and sign based on transaction type
                      Color amountColor;
                      String sign;
                      if (transaction.transactionType.toLowerCase() ==
                          'deposit') {
                        amountColor =
                            const Color.fromARGB(255, 14, 142, 18); // Green
                        sign = '+';
                      } else if (transaction.transactionType.toLowerCase() ==
                          'purchase') {
                        amountColor =
                            const Color.fromARGB(255, 194, 16, 3); // Red
                        sign = '-';
                      } else if (transaction.transactionType.toLowerCase() ==
                          'refund') {
                        amountColor =
                            const Color.fromARGB(255, 194, 16, 3); // Red
                        sign = '-';
                      } else {
                        amountColor = const Color.fromARGB(255, 14, 142, 18);
                        sign = '';
                      }

                      // Format the timestamp
                      DateTime timestamp =
                          DateTime.parse(transaction.timestamp);
                      String formattedDate =
                          DateFormat('MMM d, yyyy').format(timestamp);
                      String formattedTime =
                          DateFormat('h:mm a').format(timestamp);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(transaction.transactionType,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: darkblue)),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '$sign${transaction.amount}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: amountColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('$formattedDate $formattedTime',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
