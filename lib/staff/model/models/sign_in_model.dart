import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/staff/model/models/user_model.dart';
 
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
    sharedPreferences!.setString("token", jsonData['access_token']);
    // userToken = jsonData['access_token'];
    return SignInModel(
      accessToken: jsonData['access_token'],
      tokenType: jsonData['token_type'],
      expiresIn: jsonData['expires_in'],
      userModel: UserModel.fromJson(jsonData['user']),
    );
  }
}
