// ignore_for_file: avoid_print

import 'package:warehouse_manegment_system/main.dart';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String dateJoined;
  final String role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.dateJoined,
    required this.role,
  });

  factory UserModel.fromJson(jsonData) {
    // userId = jsonData['id'];
    // print('$userId');
    // firstnameM = jsonData['first_name'];
    // lastnameM = jsonData['last_name'];
    // usernameM = jsonData['username'];
    // emailM = jsonData['email'];
    sharedPreferences!.setString("role", jsonData['role']);
    sharedPreferences!.setString("firstName", jsonData['first_name']);
    sharedPreferences!.setString("lastName", jsonData['last_name']);
    sharedPreferences!.setString("email", jsonData['email']);
    return UserModel(
      id: jsonData['id'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      username: jsonData['username'],
      email: jsonData['email'],
      dateJoined: jsonData['date_joined'],
      role: jsonData['role'],
    );
  }
}

// String? firstnameM, lastnameM, usernameM, emailM;
