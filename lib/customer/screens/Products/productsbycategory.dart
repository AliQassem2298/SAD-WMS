// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/CategoryModel.dart';
import 'package:warehouse_manegment_system/customer/controller/BroductByCat_Controller.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Basket/BasketPage.dart';
import 'package:warehouse_manegment_system/customer/screens/Products/ListviewProductsByCategory.dart';

import '../../../constans.dart';

bool isFaClickedPublic = false;

class ProductBycategory extends StatelessWidget {
  const ProductBycategory({super.key, required this.product_id});
  final int product_id;

  @override
  Widget build(BuildContext context) {
    final CategoryModell categoryHome_Model =
        ModalRoute.of(context)!.settings.arguments as CategoryModell;

    final ProductByCategoryController controller =
        Get.put(ProductByCategoryController());
    controller.initialize(categoryHome_Model);

    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: GetBuilder<ProductByCategoryController>(
          builder: (_) {
            return Column(
              children: [
                const SizedBox(height: 25),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                          controller.categoryModel.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                              color: darkblue),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(() => BasketPage());
                          },
                          icon: const Icon(
                            Icons.shopping_basket_outlined,
                            color: darkblue,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Expanded(child: ListViewProductsByCategory(id: product_id)),
              ],
            );
          },
        ),
      ),
    );
  }
}
