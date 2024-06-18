class LocationsModel {
  final int id;
  final String name;
  final String aisle;
  final String rack;
  final String level;
  final String barcode;
  final int capacity;
  final int warehouse;

  LocationsModel({
    required this.id,
    required this.name,
    required this.aisle,
    required this.rack,
    required this.level,
    required this.barcode,
    required this.capacity,
    required this.warehouse,
  });

  factory LocationsModel.fromJson(jsonData) {
    return LocationsModel(
      id: jsonData['id'],
      name: jsonData['name'],
      aisle: jsonData['aisle'],
      rack: jsonData['rack'],
      level: jsonData['level'],
      barcode: jsonData['barcode'],
      capacity: jsonData['capacity'],
      warehouse: jsonData['warehouse'],
    );
  }
}
