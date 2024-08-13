import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/BasketModel/BasketModel.dart';

// const kFirstColor = Color(0xff2B1836);
// const kSecondtColor = Color(0xff591C3C);
// const kThierdColor = Color(0xff911C3A);
// const kFourthColor = Color(0xffBB1636);

// const kFirstColor = Color(0xff6e3a35);
// const kSecondtColor = Color(0xffc14b2d);
// const kThierdColor = Color(0xff9b9ca3);
// const kFourthColor = Color(0xffd9dadb);

//////// ours
const kFirstColor = Color(
    0xFF00457c); //0xff2d77c1 //////////////////////////0xFF00237D///1B3799//////00457c
const kFirstColor2 = Color(
    0xff0079c1); //0xff2d77c1 /////////////////////////0xff2d77c1 ////2D5BFF//////0079c1
const kFirstColor3 = Color(0xF300BFFF); //0xff2d77c1

const kSecondtColor = Color(0xff35626e); ////35626e
const kFourthColor = Color(0xff9b9ca3);
const kThierdColor = Color(0xffC1C1C1); //0xffd9dadb//0xFFBCBCBC////C1C1C1
const kFifthColor = Color(0xffF3A46C); //////////

const kBackGroundColor =
    Color.fromARGB(255, 110, 181, 217); /////B0BEC5//////E8E8E8
const kCardBackGroundColor = Color(0xFFEBEBEB);

///EBEBEB
const kWhiteColor = Colors.white;
const kTextColor = Color(0xFF607D8B);

// const kFirstColor = Color(0xff002244);
// const kSecondtColor = Color(0xff69BE28);
// const kThierdColor = Color(0xffD0D5D8);
// const kFourthColor = Color(0xff543232);

// const kFirstColor = Color(0xff002244);
// const kSecondtColor = Color(0xffC60C30);
// const kThierdColor = Color(0xffB0B7BC);
// const kFourthColor = Color(0xff4C2E34);

class ScreenSizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / 100) * screenWidth;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / 100) * screenHeight;
  }
}

extension SizeExtension on num {
  double get w => ScreenSizeConfig.getProportionateScreenWidth(toDouble());
  double get h => ScreenSizeConfig.getProportionateScreenHeight(toDouble());
}

const lightblue = Color(0xff002244);
const darkblue = Color(0xff00457c);
const blackcolor = Colors.black;
const whitecolor = Colors.white;
const lightgreycolor = Color(0xffb0b7bc);
const darkgreycolor = Color(0xff8a8d8f);

const Tdefaultpadding = 20.0;
const Defaultshadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 1,
    color: Color.fromARGB(121, 158, 158, 158));
List<Map<String, dynamic>> basketItemsPlaceOrderList1 = [];
List<BasketItemModel> basketItems = [];
