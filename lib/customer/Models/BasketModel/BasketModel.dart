// ignore_for_file: file_names, non_constant_identifier_names
class BasketItemModel {
  final String name;
  num price;
  final String image;
  int counter, id;
  BasketItemModel({
    required this.name,
    required this.price,
    required this.image,
    required this.counter,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          image == other.image &&
          counter == other.counter &&
          id == other.id;

  @override
  int get hashCode =>
      name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      counter.hashCode ^
      id.hashCode;
}
