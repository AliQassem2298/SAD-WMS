import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlideMenuTitle extends StatelessWidget {
  const CustomSlideMenuTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
          ),
          title: Text(
            'profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
