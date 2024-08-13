// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/Models/CompanyModel.dart';
import 'package:warehouse_manegment_system/customer/screens/Products/ListviewProductsBysupplier.dart';

class ProductsBySupplier extends StatelessWidget {
  const ProductsBySupplier({super.key, required this.product_id});
  final int product_id;
  @override
  Widget build(BuildContext context) {
    Company_Model companyhomeModel =
        ModalRoute.of(context)!.settings.arguments as Company_Model;
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: darkblue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    companyhomeModel.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: darkblue),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(child: listviewproducts(id: product_id)),
        ],
      )),
    );
  }
}
