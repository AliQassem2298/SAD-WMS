import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/suggested_locations_model.dart';

class SuggestedLocationsService {
  Future<SuggestedLocationModel> suggestedLocations({required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/shipments/details/$id/suggest-locations/',
      token: sharedPreferences!.getString("token"),
    );
    return SuggestedLocationModel.fromJson(data);
  }
}
