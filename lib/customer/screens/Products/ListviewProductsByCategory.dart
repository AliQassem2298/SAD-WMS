// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/ProductsModel.dart';
import 'package:warehouse_manegment_system/customer/Services/GetProductsByCategory_Services.dart';
import 'package:warehouse_manegment_system/customer/screens/Products/ProductCart.dart';

class ListViewProductsByCategory extends StatelessWidget {
  const ListViewProductsByCategory({
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
          Expanded(
            child: FutureBuilder<List<GetProductsModel>>(
              future: GetProductsByCategoryService().getproducts(id: id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading spinner while waiting for the data
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff88BFDD),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Handle any errors
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // Show a "No items found" message with animation
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: Icon(
                              Icons.sentiment_dissatisfied,
                              key: ValueKey<int>(
                                  DateTime.now().millisecondsSinceEpoch),
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'No items found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  List<GetProductsModel> products = snapshot.data!;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => ProductCard(
                      products: products[index],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
