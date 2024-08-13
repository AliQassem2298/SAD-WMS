// ignore_for_file: file_names

import 'package:warehouse_manegment_system/customer/Models/ProductsModel.dart';
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class GetProductsService {
  Future<GetProductsModel> getproducts({required int id}) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/products/$id/',
      // token: '',
    );
    return GetProductsModel.fromJson(data);
  }
}
