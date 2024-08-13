// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Services/GetProuctsBySupplier.dart';
import 'package:warehouse_manegment_system/customer/screens/Products/ProductCart.dart';

import '../../Models/ProductsModel.dart';

// ignore: camel_case_types
class listviewproducts extends StatelessWidget {
  const listviewproducts({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //const BoxDescription(),
          Expanded(
              child: FutureBuilder<List<GetProductsModel>>(
                  future: GetProductsBySupplierService().getproducts(id: id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<GetProductsModel> products = snapshot.data!;
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => ProductCard(
                          products: products[index],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff88BFDD),
                          ),
                        ),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
