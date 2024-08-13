// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../../../constans.dart';
import 'ListviewMyOrder.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: darkblue,
          title: const Text(
            'My Orders',
            style: TextStyle(color: Colors.black, fontSize: 25),
          )),
      body: const ListView_MyOrder(),
    );
  }
}
