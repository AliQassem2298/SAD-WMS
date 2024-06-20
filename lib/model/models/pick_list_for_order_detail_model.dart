// class PickListForOrderDetailModel {
//   final int orderDetailId;
//   final int productId;
//   final String productName;
//   final int quantity;
//   final List<Location> locations;

//   PickListForOrderDetailModel({
//     required this.orderDetailId,
//     required this.productId,
//     required this.productName,
//     required this.quantity,
//     required this.locations,
//   });

//   factory PickListForOrderDetailModel.fromJson(json) {
//     final List<dynamic> locationsJson = json['locations'];
//     final List<Location> locations = locationsJson.map((locationJson) {
//       return Location.fromJson(locationJson);
//     }).toList();

//     return PickListForOrderDetailModel(
//       orderDetailId: json['order_detail_id'],
//       productId: json['product_id'],
//       productName: json['product_name'],
//       quantity: json['quantity'],
//       locations: locations,
//     );
//   }
// }

// class Location {
//   final int locationId;
//   final String locationName;
//   final String aisle;
//   final String rack;
//   final String level;
//   final int quantity;
//   final String barcode;
//   final int capacityLeft;

//   Location({
//     required this.locationId,
//     required this.locationName,
//     required this.aisle,
//     required this.rack,
//     required this.level,
//     required this.quantity,
//     required this.barcode,
//     required this.capacityLeft,
//   });

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       locationId: json['location_id'],
//       locationName: json['location_name'],
//       aisle: json['aisle'],
//       rack: json['rack'],
//       level: json['level'],
//       quantity: json['quantity'],
//       barcode: json['barcode'],
//       capacityLeft: json['capacity_left'],
//     );
//   }
// }
