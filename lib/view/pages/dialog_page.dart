import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';

class DialogPage extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final String routeName;
  const DialogPage({
    Key? key,
    required this.routeName,
    this.title = 'Account Created Successfully',
    this.content = 'Please Sign In',
    this.buttonText = 'Sign In',
  }) : super(key: key);

  static String id = '/DialogPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              kFirstColor,
              kFirstColor2,
            ],
          ),
        ),
        child: AlertDialog(
          elevation: 50,
          backgroundColor: kCardBackGroundColor,
          title: Text(
            title,
            style: const TextStyle(
              color: kSecondtColor,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
              color: kSecondtColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAllNamed(routeName);
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kFirstColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
