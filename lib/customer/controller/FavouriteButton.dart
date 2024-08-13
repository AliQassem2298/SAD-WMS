// ignore_for_file: file_names, non_constant_identifier_names
import 'package:get/get.dart';

import '../Models/ProductsModel.dart';
import '../Services/Favourite_Services/DeleteFavourite_Services.dart';
import '../Services/Favourite_Services/PostAddfavourite_Services.dart';
import 'FavouritePageController.dart';

class FavoriteController extends GetxController {
  var isFaClicked = false.obs;
  void up() {
    update();
  }

  void FavoriteStatus(GetProductsModel productsModel, String token) async {
    if (isFaClicked.value) {
      await DeleteFavoriteService().deleteFavoriteService(
        id: productsModel.id,
        token: token,
      );
      isFaClicked.value = false;
    } else {
      await PostAddFavoriteService().postAddFavoriteService(
        id: productsModel.id,
        token: token,
      );
      isFaClicked.value = true;
    }

    // Fetch the updated list after making changes
    FavoriteListController listController = Get.find();
    listController.fetchFavoriteList();
  }
}
