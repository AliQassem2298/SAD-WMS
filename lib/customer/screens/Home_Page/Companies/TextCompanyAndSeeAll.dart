// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Companies/AllCompanies.dart';

class TextCompanyBody extends StatelessWidget {
  const TextCompanyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          const Text(
            'Top Companies',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                Get.to(() => const All_InCompanies());
              },
              child: const Text(
                'See All',
                style: TextStyle(
                    color: darkblue, fontSize: 15, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
