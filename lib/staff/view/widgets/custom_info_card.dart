import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/constans.dart';

// ignore: must_be_immutable
class CustomInfoCard extends StatelessWidget {
  CustomInfoCard({
    required this.lastName,
    required this.firstName,
    required this.email,
    super.key,
  });
  String lastName, firstName, email;
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
      title: Row(
        children: [
          Text(
            firstName,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: ScreenSizeConfig.blockSizeHorizontal),
          Text(
            lastName,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      subtitle: Text(
        email,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
