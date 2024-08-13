import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/view/pages/dialog_page.dart';

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
  final VoidCallback? onPressed;
  final double? fontSize;

  const CustomButton({
    Key? key,
    required this.text,
    this.fontSize,
    this.hasBorder = true,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.dialogTitle,
    this.dialogContent,
    this.dialogButtonText,
    this.routeName,
    this.gradient,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);

    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
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
        height: ScreenSizeConfig.getProportionateScreenHeight(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: hasBorder ? Border.all(color: borderColor, width: 2) : null,
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize:
                  fontSize ?? ScreenSizeConfig.getProportionateScreenWidth(4),
              color: hasBorder ? textColor : kFirstColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
