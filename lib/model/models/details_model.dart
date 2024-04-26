class DetailsModel {
  final String detail;

  DetailsModel({
    required this.detail,
  });

  factory DetailsModel.fromJson(jsonData) {
    return DetailsModel(detail: jsonData['detail']);
  }
}
