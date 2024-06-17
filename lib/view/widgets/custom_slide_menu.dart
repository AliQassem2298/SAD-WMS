// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomSlideMenuTitle extends StatelessWidget {
  CustomSlideMenuTitle({
    required this.icon,
    required this.text,
    required this.ontap,
    super.key,
  });
  IconData icon;
  String text;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: SizedBox(
          height: ScreenSizeConfig.blockSizeVertical * 4,
          width: ScreenSizeConfig.blockSizeHorizontal * 10,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
