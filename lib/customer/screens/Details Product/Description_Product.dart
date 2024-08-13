// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../Models/ProductsModel.dart';

// ignore: camel_case_types
class Description_Product extends StatelessWidget {
  const Description_Product({
    super.key,
    required this.det,
  });
  final GetProductsModel det;
  @override
  Widget build(BuildContext context) {
    // GetDetailsProductMoGetProductsModeldel getProductsModel =
    //     ModalRoute.of(context)!.settings.arguments as GetDetailsProductModel;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Tdefaultpadding),
      child: Text(
        det.name,
        style: const TextStyle(
            height: 1.5, fontSize: 19, fontWeight: FontWeight.w500),
      ),
    );
  }
}
