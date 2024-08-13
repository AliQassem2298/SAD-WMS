// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import '../../../Models/CompanyModel.dart';
import '../Category/productsbysupplier.dart';

class CardCompany extends StatelessWidget {
  const CardCompany({super.key, required this.com});
  final Company_Model com;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 160,
      child: InkWell(
        onTap: () {
          Get.to(
              () => ProductsBySupplier(
                    product_id: com.id,
                  ),
              arguments: com);
        },
        child: Card(
          shadowColor: darkgreycolor,
          elevation: 14,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                'http://10.0.2.2:8000${com.photo}',
                height: 100,
                width: 100,
              ),
              Text(
                com.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
