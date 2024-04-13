// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';

// class CustomeButton extends StatelessWidget {
//   CustomeButton({super.key, required this.text});
//   String text;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
//       child: MaterialButton(
//         color: Colors.amber,
//         onPressed: () {},
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/view/pages/dialog_page.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool hasBorder;
  final Color borderColor;
  final Color textColor;
  final String? dialogTitle;
  final String? dialogContent;
  final String? dialogButtonText;
  final String? routeName;
  final Gradient? gradient;
  final VoidCallback? onPressed; // New onPressed callback

  const CustomButton({
    Key? key,
    required this.text,
    this.hasBorder = true,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.dialogTitle,
    this.dialogContent,
    this.dialogButtonText,
    this.routeName,
    this.gradient,
    this.onPressed, // Added onPressed parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!(); // Execute the onPressed callback if provided
        } else if (dialogTitle != null &&
            dialogContent != null &&
            dialogButtonText != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogPage(
                routeName: routeName!,
                title: dialogTitle!,
                content: dialogContent!,
                buttonText: dialogButtonText!,
              );
            },
          );
        } else if (routeName != null) {
          Get.toNamed(routeName!);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: hasBorder ? Border.all(color: borderColor) : null,
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: hasBorder ? textColor : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}



/*
CustomButton(text: 'Button', hasBorder: true, borderColor: Colors.white)
CustomButton(text: 'Button', hasBorder: false)
 */