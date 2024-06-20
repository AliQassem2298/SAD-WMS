// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/customers_order_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/list_all_orders_model.dart';

class CustomOrdersCard extends StatelessWidget {
  CustomOrdersCard({
    required this.listAllOrdersModel,
    super.key,
  });
  ListAllOrdersModel listAllOrdersModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: InkWell(
        onTap: () {
          listAllOrdersModel.status == 'cancelled'
              ? null
              : Get.toNamed(
                  CustomerOrderPageController.id,
                  arguments: listAllOrdersModel,
                );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
              height: 20.h,
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
                    'Custome: ${listAllOrdersModel.customerModel.username}',
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
                    'Total Price :${listAllOrdersModel.totalPrice}' + r'$',
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
              top: 6.h,
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
                    : listAllOrdersModel.status == 'picked'
                        ? Image.asset(
                            'assets/picked.png',
                            height: 8.h,
                            width: 15.w,
                          )
                        : listAllOrdersModel.status == 'packed'
                            ? Image.asset(
                                'assets/packed.png',
                                height: 8.h,
                                width: 15.w,
                              )
                            : listAllOrdersModel.status == 'delivered'
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
            Positioned(
              right: 0.w,
              child: Container(
                width: 25.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: kFirstColor2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Center(
                  child: Text(
                    listAllOrdersModel.priority,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 5.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
