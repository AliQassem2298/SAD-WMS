class DetailModel {
  final String detail;

  DetailModel({
    required this.detail,
  });

  factory DetailModel.fromJson(jsonData) {
    return DetailModel(detail: jsonData['detail']);
  }
}
