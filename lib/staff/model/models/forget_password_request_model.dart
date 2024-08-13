class ForgetPasswordRequestModel {
  final String detail;

  ForgetPasswordRequestModel({required this.detail});

  factory ForgetPasswordRequestModel.fromJson(jsonData) {
    return ForgetPasswordRequestModel(detail: jsonData['detail']);
  }
}
