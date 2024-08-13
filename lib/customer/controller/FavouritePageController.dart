// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/Models/FavouriteModel/ShowFavourite_Model.dart';
import 'package:warehouse_manegment_system/customer/Services/Favourite_Services/DeleteFavourite_Services.dart';
import 'package:warehouse_manegment_system/customer/Services/Favourite_Services/getShowfavourites_Services.dart';
import 'package:warehouse_manegment_system/main.dart';

class FavoriteListController extends GetxController {
  var favoriteList = <ShowFavoriteModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteList();
  }

  void fetchFavoriteList() async {
    try {
      isLoading(true);
      var favorites = await GetShowFavoritesService().getShowFavorite();
      favoriteList.value = favorites;
    } finally {
      isLoading(false);
    }
  }

  void deleteFavorite(int id) async {
    try {
      await DeleteFavoriteService().deleteFavoriteService(
        id: id,
        token: sharedPreferences!.getString("token")!,
      );
      favoriteList.removeWhere((item) => item.product.id == id);
    } catch (error) {
      Get.snackbar('Error', 'Failed to delete favorite');
    }
  }

  void up() {
    update();
  }
}
