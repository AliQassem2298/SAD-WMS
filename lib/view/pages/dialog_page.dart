import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Color(0xff2B1836),
              Color(0xff591C3C),
              Color(0xff911C3A),
              Color(0xffBB1636)
            ],
          ),
        ),
        child: AlertDialog(
          elevation: 50,
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
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
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
