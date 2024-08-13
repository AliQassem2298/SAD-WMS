// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../Models/ProductsModel.dart';

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    super.key,
    required this.imageproduct,
  });
  final GetProductsModel imageproduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      decoration: const BoxDecoration(
          // color: whitecolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: Tdefaultpadding),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
              ),
              Image.network(
                'http://10.0.2.2:8000${imageproduct.photo}',
                width: 200,
                height: 200,
                // fit: BoxFit.fill,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
