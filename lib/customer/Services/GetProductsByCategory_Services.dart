// ignore_for_file: file_names

import 'package:warehouse_manegment_system/customer/Models/ProductsModel.dart';

import '../../staff/model/helper/api.dart';

class GetProductsByCategoryService {
  Future<List<GetProductsModel>> getproducts({required int id}) async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(
      url: '$baseUrl/products/category/$id/',
    );
    // ignore: avoid_print
    print(data);
    List<GetProductsModel> productsLists = [];
    for (int i = 0; i < data.length; i++) {
      productsLists.add(GetProductsModel.fromJson(data[i]));
    }
    return productsLists;
  }
}
