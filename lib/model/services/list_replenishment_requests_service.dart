import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/list_replenishment_requests_MODEL.dart';

class ListReplenishmentRequestsService {
  Future<List<ListReplenishmentRequestsModel>>
      listReplenishmentRequests() async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/inventory/replenishment-requests/',
      token: sharedPreferences!.getString("token"),
    );
    return data
        .map((item) => ListReplenishmentRequestsModel.fromJson(item))
        .toList();
  }
}
