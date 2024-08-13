class PickListForOrderDetailModel {
  final int orderDetailId;
  final int productId;
  final String productName;
  final int quantity;
  final List<PickLocationsModel> pickLocationModel;

  PickListForOrderDetailModel({
    required this.orderDetailId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.pickLocationModel,
  });

  factory PickListForOrderDetailModel.fromJson(jsonData) {
    return PickListForOrderDetailModel(
      orderDetailId: jsonData['order_detail_id'],
      productId: jsonData['product_id'],
      productName: jsonData['product_name'],
      quantity: jsonData['quantity'],
      pickLocationModel: (jsonData['locations'] as List)
          .map((locationJson) => PickLocationsModel.fromJson(locationJson))
          .toList(),
    );
  }
}

class PickLocationsModel {
  final int locationId;
  final String locationName;
  final String aisle;
  final String rack;
  final String level;
  final int quantity;
  final String barcode;
  final int capacityLeft;

  PickLocationsModel({
    required this.locationId,
    required this.locationName,
    required this.aisle,
    required this.rack,
    required this.level,
    required this.quantity,
    required this.barcode,
    required this.capacityLeft,
  });

  factory PickLocationsModel.fromJson(jsonData) {
    return PickLocationsModel(
      locationId: jsonData['location_id'],
      locationName: jsonData['location_name'],
      aisle: jsonData['aisle'],
      rack: jsonData['rack'],
      level: jsonData['level'],
      quantity: jsonData['quantity'],
      barcode: jsonData['barcode'],
      capacityLeft: jsonData['capacity_left'],
    );
  }
}
