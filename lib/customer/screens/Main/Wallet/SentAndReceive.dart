// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/constans.dart';

class SentAndReceive extends StatelessWidget {
  const SentAndReceive({
    super.key,
  });

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: darkblue,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              _showSnackbar(context, 'For deposit, contact customer service');
            },
            child: Card(
              color: Colors.grey.shade100,
              borderOnForeground: true,
              elevation: 15,
              child: Container(
                height: 60,
                width: 145,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text('deposit',
                      style: TextStyle(
                          fontSize: 18,
                          color: darkblue,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: MaterialButton(
            onPressed: () {
              _showSnackbar(context, 'To withdraw, contact customer service');
            },
            child: Card(
              color: Colors.grey.shade100,
              borderOnForeground: true,
              elevation: 15,
              child: Container(
                height: 60,
                width: 145,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text('withdraw',
                      style: TextStyle(
                          fontSize: 18,
                          color: darkblue,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
