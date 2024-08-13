// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/controller/SearchController.dart'
    as custom;

class SearchMedicine extends SearchDelegate {
  // Initialize the controller using the alias
  final custom.SearchController searchController =
      Get.put(custom.SearchController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          searchController.updateQuery(query);
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchController.updateQuery(query);

    return Obx(() {
      if (searchController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (searchController.products.isEmpty) {
        return const Center(child: Text('Not Found'));
      } else {
        return ListView.builder(
          itemCount: searchController.products.length,
          itemBuilder: (context, index) {
            final product = searchController.products[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  onTap: () {
                    // Navigate to the details page
                    // Get.to(() => bodyDetails(product: product));
                  },
                  title: Text(
                    product.name,
                    style: TextStyle(
                      color: Color(0xff003A71),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'Product details go here',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://10.0.2.2:8000${product.photo}',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Color(0xff003A71)),
                ),
              ),
            );
          },
        );
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchController.updateQuery(query);

    return Obx(() {
      if (searchController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (searchController.products.isEmpty) {
        return const Center(child: Text('Not Found'));
      } else {
        return ListView.builder(
          itemCount: searchController.products.length,
          itemBuilder: (context, index) {
            final product = searchController.products[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  onTap: () {
                    // Navigate to the details page
                    // Get.to(() => bodyDetails(product: product));
                  },
                  title: Text(
                    product.name,
                    style: TextStyle(
                      color: Color(0xff003A71),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'Product details go here', // Replace with actual details
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://10.0.2.2:8000${product.photo}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Color(0xff003A71)),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
