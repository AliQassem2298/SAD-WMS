// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/suggested_locations_page_controller.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/order_model.dart';

class CustomCustomerOrderCard extends StatelessWidget {
  OrderModel orderModel;
  CustomCustomerOrderCard({
    required this.orderModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            SuggestedLocationsPageController.id,
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(left: 1.w, right: 1.w, bottom: 1.h),
              width: 60.w,
              decoration: BoxDecoration(
                color: kCardBackGroundColor,
                // border: Border.all(),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Image.asset('assets/clock icon.png').paddingOnly(
                  //   bottom: 40,
                  //   right: 130,
                  // ),
                  // Icon(
                  //   Icons.local_shipping,
                  //   color: Colors.white,
                  //   size: 110,
                  // ),

                  Text(
                    'name: ${orderModel.productModel.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 5.5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'quantity: ${orderModel.quantity}',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 4.7.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'price: ${orderModel.productModel.price}' + r'$',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 4.7.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'status: ${orderModel.status}',
                    style: TextStyle(
                      color: kFirstColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 4.7.w,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
            Positioned(
              top: -7.h,
              left: 9.w,
              child: Container(
                height: 14.h,
                width: 28.w,
                decoration: BoxDecoration(
                  // color: kSecondtColor,
                  border: Border.all(color: kSecondtColor, width: 0.8.w),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Image.network(
                  '${baseUrlImage}${orderModel.productModel.photo}',
                  height: 14.h,
                  width: 28.w,
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              right: 0.w,
              child: orderModel.status == 'pending'
                  ? Container(
                      height: 5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            kFirstColor2,
                            kFirstColor,
                          ],
                        ),
                        // color: kSecondtColor,
                        // border: Border.all(
                        //   color: kFifthColor,
                        // ),
                        // boxShadow: [],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        ),
                        color: kBackGroundColor,
                      ),
                      child: Center(
                        child: Text(
                          'Pick',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 5.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
            Positioned(
              top: 3.h,
              left: 8.w,
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                  color: kBackGroundColor,
                  // border: Border.all(),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(35),
                  // color: Color(0xff9b9ca3),
                ),
                child: orderModel.status == 'pending'
                    ? Image.asset(
                        'assets/clock2.jpg',
                        height: 8.h,
                        width: 15.w,
                      )
                    : orderModel.status == 'picked'
                        ? Image.asset(
                            'assets/picked.png',
                            height: 8.h,
                            width: 15.w,
                          )
                        : orderModel.status == 'packed'
                            ? Image.asset(
                                'assets/packed.png',
                                height: 8.h,
                                width: 15.w,
                              )
                            : orderModel.status == 'delivered'
                                ? Image.asset(
                                    'assets/done.png',
                                    height: 8.h,
                                    width: 15.w,
                                  )
                                : Image.asset(
                                    'assets/cancelled.png',
                                    height: 8.h,
                                    width: 15.w,
                                  ),
              ),
            ),
            // Positioned(
            //   top: 20,
            //   left: 30,
            //   child: Container(
            //     height: 40,
            //     width: 40,
            //     decoration: BoxDecoration(
            //       color: kSecondtColor,
            //       // border: Border.all(),
            //       // boxShadow: [],
            //       borderRadius: BorderRadius.circular(35),
            //       // color: Color(0xff9b9ca3),
            //     ),
            //     child: Image.asset(
            //       'assets/clock icon.png',
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
