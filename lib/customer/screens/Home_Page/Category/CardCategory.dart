// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/Models/CategoryModel.dart';

import '../../Products/productsbycategory.dart';

class CradCategory extends StatelessWidget {
  const CradCategory({
    super.key,
    required this.category,
  });
  final CategoryModell category;

  @override
  Widget build(BuildContext context) {
    // CategoryModel getProductsModel =
    //     ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return SizedBox(
      width: 140,
      height: 120,
      child: InkWell(
        onTap: () {
          Get.to(
            () => ProductBycategory(product_id: category.id),
            arguments: category,
          );
        },
        child: Card(
          shadowColor: darkgreycolor,
          elevation: 14,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'http://10.0.2.2:8000${category.photo}',
                height: 120,
                width: 120,
              ),
              Text(
                category.name,
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
