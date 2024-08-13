// ignore_for_file: file_names

import '../../staff/model/helper/api.dart';
import '../Models/CompanyModel.dart';

class GetcompanyService {
  Future<List<Company_Model>> getcompany() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: '$baseUrl/suppliers/');

    // ignore: non_constant_identifier_names
    List<Company_Model> CompanyLists = [];
    for (int i = 0; i < data.length; i++) {
      CompanyLists.add(Company_Model.fromJson(data[i]));
    }
    return CompanyLists;
  }
}
