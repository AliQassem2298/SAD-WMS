class LogoutModel {
  final String detail;

  LogoutModel({
    required this.detail,
  });

  factory LogoutModel.fromJson(jsonData) {
    return LogoutModel(detail: jsonData['detail']);
  }
}
