// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/ProductsModel.dart';

import '../../../constans.dart';

// ignore: camel_case_types
class Category_Supplier_Products extends StatelessWidget {
  const Category_Supplier_Products({
    super.key,
    required this.dete,
  });
  final GetProductsModel dete;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Category:',
              style: TextStyle(
                  fontSize: 20, color: darkblue, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Tdefaultpadding),
              child: Text(
                dete.category.name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        const SizedBox(
          height: Tdefaultpadding / 2,
        ),
        Row(
          children: [
            const Text(
              'Supplier:',
              style: TextStyle(
                  fontSize: 20, color: darkblue, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Tdefaultpadding),
              child: Text(
                dete.supplier.name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            )
          ],
        )
      ],
    );
  }
}
