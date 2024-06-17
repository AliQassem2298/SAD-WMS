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
    ScreenSizeConfig.init(context); // Initialize ScreenSizeConfig

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
            style: TextStyle(
              color: kSecondtColor,
              fontSize: ScreenSizeConfig.blockSizeHorizontal * 6,
            ),
          ),
          content: Text(
            content,
            style: TextStyle(
              color: kSecondtColor,
              fontSize: ScreenSizeConfig.blockSizeHorizontal * 4.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAllNamed(routeName);
              },
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: ScreenSizeConfig.blockSizeHorizontal * 5,
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
