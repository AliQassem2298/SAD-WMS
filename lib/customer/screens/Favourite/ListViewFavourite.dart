// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/FavouriteModel/ShowFavourite_Model.dart';
import 'package:warehouse_manegment_system/customer/controller/FavouritePageController.dart';

class ListView_Favourite extends StatelessWidget {
  ListView_Favourite({Key? key}) : super(key: key);

  final FavoriteListController controller = Get.put(FavoriteListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: const Center(
            child: CircularProgressIndicator(
              color: Color(0xff88BFDD),
            ),
          ),
        );
      } else if (controller.favoriteList.isEmpty) {
        return const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  "there is no favorite item",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff003A71),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: controller.favoriteList.length,
            itemBuilder: (context, index) =>
                newMethod(controller.favoriteList[index]),
          ),
        );
      }
    });
  }

  Card newMethod(ShowFavoriteModel data) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.network(
                  'http://10.0.2.2:8000${data.product.photo}',
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        data.product.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Text(
                            data.product.price,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              controller.deleteFavorite(data.product.id);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
