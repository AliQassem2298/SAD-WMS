// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/model/models/list_replenishment_requests_MODEL.dart';

class CustomReplenshmentRequestCard extends StatelessWidget {
  CustomReplenshmentRequestCard({
    required this.listAllOrdersModel,
    super.key,
  });
  ListReplenishmentRequestsModel listAllOrdersModel;

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    double price = double.parse(listAllOrdersModel.productModel.price);
    int quantity = listAllOrdersModel.quantity;
    totalPrice = price * quantity;
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
            height: 40.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kCardBackGroundColor,
              // border: Border.all(),
              // boxShadow: [],
              borderRadius: BorderRadius.circular(35),
              // color: Color(0xff9b9ca3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.local_shipping,
                //   color: Colors.white,
                //   size: 110,
                // ),
                Text(
                  '${listAllOrdersModel.productModel.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 5.5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Total Price :${calculateTotalPrice()}' + r'$',
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'quantity: ${listAllOrdersModel.quantity}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'reason: ${listAllOrdersModel.reason}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'location :${listAllOrdersModel.locationsModel.name}',
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Status :${listAllOrdersModel.status}',
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ).paddingOnly(left: 10.w),
          ),
          Positioned(
            top: 15.h,
            left: 5.w,
            child: Container(
              height: 8.h,
              width: 15.w,
              decoration: BoxDecoration(
                // border: Border.all(),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: listAllOrdersModel.status == 'pending'
                  ? Image.asset(
                      'assets/clock2.jpg',
                      height: 8.h,
                      width: 15.w,
                    )
                  : listAllOrdersModel.status == 'approved'
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
        ],
      ),
    );
  }
}
          // Positioned(
          //   right: 0.w,
          //   child: Container(
          //     width: 25.w,
          //     height: 5.h,
          //     decoration: BoxDecoration(
          //       color: kFirstColor2,
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(35),
          //         topRight: Radius.circular(35),
          //       ),
          //     ),
          //     child: Center(
          //       child: Text(
          //         listAllOrdersModel.priority,
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 5.w,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),