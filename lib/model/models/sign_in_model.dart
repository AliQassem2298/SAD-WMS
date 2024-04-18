import 'package:warehouse_manegment_system/model/models/user_model.dart';

class SignInModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserModel userModel;

  SignInModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userModel,
  });

  factory SignInModel.fromJson(jsonData) {
    userToken = jsonData['access_token'];
    return SignInModel(
      accessToken: jsonData['access_token'],
      tokenType: jsonData['token_type'],
      expiresIn: jsonData['expires_in'],
      userModel: UserModel.fromJson(jsonData['user']),
    );
  }
}

String? userToken;
