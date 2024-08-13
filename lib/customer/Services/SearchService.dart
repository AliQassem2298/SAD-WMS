// ignore_for_file: prefer_interpolation_to_compose_strings, missing_required_param, avoid_print, use_rethrow_when_possible, file_names

import 'package:warehouse_manegment_system/customer/Models/Search/SearchModel.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class SearchService {
  Future<SearchModel> getsearch(String query) async {
    try {
      final response = await Api().get(
        url: '$baseUrl/products/search/?q=' + query,
      );
      print('API Response: $response');
      List<dynamic> pro = response as List<dynamic>;

      List<Product> productList =
          pro.map((json) => Product.fromJson(json)).toList();

      return SearchModel(
        products: productList,
      );
    } catch (error) {
      print('Error occurred while fetching search results: $error');
      throw error;
    }
  }
}
