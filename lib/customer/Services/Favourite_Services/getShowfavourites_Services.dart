// ignore_for_file: file_names, missing_required_param, avoid_print

import 'package:warehouse_manegment_system/customer/Models/FavouriteModel/ShowFavourite_Model.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class GetShowFavoritesService {
  Future<List<ShowFavoriteModel>> getShowFavorite() async {
    final response = await Api().get(
      url: '$baseUrl/products/my-favorites/',
      token: sharedPreferences!.getString("token"),
    );

    // Check if the response contains a 'detail' key
    if (response is Map<String, dynamic> && response.containsKey('detail')) {
      // Handle the detail message
      final String detailMessage = response['detail'];
      print('Message: $detailMessage');
      // Return an empty list or handle it as needed
      return [];
    } else if (response is List<dynamic>) {
      // Process the list of favorite items
      List<ShowFavoriteModel> showFavoriteList = [];
      for (var item in response) {
        showFavoriteList.add(ShowFavoriteModel.fromJson(item));
      }
      return showFavoriteList;
    } else {
      // Handle unexpected response format
      print('Unexpected response format: $response');
      return [];
    }
  }
}
