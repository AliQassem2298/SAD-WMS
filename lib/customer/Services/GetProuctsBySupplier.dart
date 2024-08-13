// ignore_for_file: file_names, avoid_print


import 'package:warehouse_manegment_system/customer/Models/ProductsModel.dart';

import '../../staff/model/helper/api.dart';

class GetProductsBySupplierService {
  Future<List<GetProductsModel>> getproducts({required int id}) async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(
      url: '$baseUrl/products/supplier/$id/',
    );
    print(data);
    List<GetProductsModel> productsLists = [];
    for (int i = 0; i < data.length; i++) {
      productsLists.add(GetProductsModel.fromJson(data[i]));
    }
    return productsLists;
  }
}
