// ignore_for_file: file_names

class TopFavouriteModel {
  // ignore: non_constant_identifier_names
  final int product_id, favorite_count;
  // ignore: non_constant_identifier_names
  final String product_name, product_photo;
  // ignore: non_constant_identifier_names
  final double product_price;
  TopFavouriteModel({
    // ignore: non_constant_identifier_names
    required this.favorite_count,
    // ignore: non_constant_identifier_names
    required this.product_photo,
    // ignore: non_constant_identifier_names
    required this.product_id,
    // ignore: non_constant_identifier_names
    required this.product_name,
    // ignore: non_constant_identifier_names
    required this.product_price,
  });
  // ignore: non_constant_identifier_names
  factory TopFavouriteModel.fromJson(JsonData) {
    return TopFavouriteModel(
      product_id: JsonData['product_id'],
      product_name: JsonData['product_name'],
      product_price: JsonData['product_price'],
      product_photo: JsonData['product_photo'],
      favorite_count: JsonData['favorite_count'],
    );
  }
}
