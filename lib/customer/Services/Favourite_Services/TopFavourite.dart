// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/FavouriteModel/Top_10_FavouriteModel.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class GetTopFavouriteService {
  Future<List<TopFavouriteModel>> gettopFavorite(
      {required BuildContext? context}) async {
    // ignore: missing_required_param
    List<dynamic> data = await Api().get(
      url: '$baseUrl/products/top-10-favorite/',
    );

    List<TopFavouriteModel> showTopFavoriteList = [];
    for (int i = 0; i < data.length; i++) {
      showTopFavoriteList.add(
        TopFavouriteModel.fromJson(data[i]),
      );
    }

    return showTopFavoriteList;
  }
}
