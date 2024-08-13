// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../Models/ProductsModel.dart';
import 'Product_Image.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    super.key,
    required this.details,
  });
  final GetProductsModel details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              details.name,
              style: const TextStyle(
                  color: whitecolor, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: '',
                    style: TextStyle(color: whitecolor, fontSize: 18)),
                TextSpan(
                    text: '\$${details.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: whitecolor))
              ])),
            ),
            const SizedBox(
              width: 60,
            ),
            ProductPoster(imageproduct: details)
          ]),
        ],
      ),
    );
  }
}
