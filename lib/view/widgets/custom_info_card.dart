import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInfoCard extends StatelessWidget {
  CustomInfoCard({
    required this.name,
    required this.email,
    super.key,
  });
  String name, email;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        email,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
