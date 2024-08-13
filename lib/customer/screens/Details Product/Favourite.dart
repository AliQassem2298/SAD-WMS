// ignore_for_file: file_names, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/main.dart';

import '../../Models/ProductsModel.dart';
import '../../controller/FavouriteButton.dart';

class Favourit_Product extends StatelessWidget {
  Favourit_Product(
      {super.key, required this.productsModel, required this.activeFaDetails});
  final GetProductsModel productsModel;
  bool activeFaDetails;

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());
    controller.isFaClicked.value = activeFaDetails;

    return Row(
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(0),
          height: 40,
          width: 40,
          decoration:
              const BoxDecoration(color: darkblue, shape: BoxShape.circle),
          child: GetBuilder<FavoriteController>(
            init: controller,
            builder: (_) {
              return IconButton(
                onPressed: () async {
                  controller.FavoriteStatus(
                    productsModel,
                    sharedPreferences!.getString("token")!,
                  );
                  controller.up();
                },
                icon: Icon(
                  controller.isFaClicked.value
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: const Color(0XFF88BFDD),
                  size: 25,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
