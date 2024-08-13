// ignore_for_file: file_names, missing_required_param, non_constant_identifier_names

import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

import '../Models/CategoryModel.dart';

class GetCategryService {
  Future<List<CategoryModell>> getcategory() async {
    List<dynamic> data = await Api().get(url: '$baseUrl/categories/');

    List<CategoryModell> CategoryLists = [];
    for (int i = 0; i < data.length; i++) {
      CategoryLists.add(CategoryModell.fromJson(data[i]));
    }
    return CategoryLists;
  }
}
