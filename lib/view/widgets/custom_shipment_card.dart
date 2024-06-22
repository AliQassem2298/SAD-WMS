// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/list_shipment_model.dart';

class CustomShipmentCard extends StatelessWidget {
  ListShipmentModel listShipmentModel;
  CustomShipmentCard({
    required this.listShipmentModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          SupplierShipmentPagController.id,
          arguments: listShipmentModel,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 3.h,
              ),
              height: 17.h,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: kCardBackGroundColor,
                border: Border.all(color: kFirstColor2, width: 0.8.w),
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
                    'Shipment from ${listShipmentModel.supplierModel.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 0.7.h,
                  ),
                  Text(
                    'Status :${listShipmentModel.status}',
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).paddingOnly(left: 10.w),
            ),
            Positioned(
              top: -2.h,
              left: 3.w,
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                  // border: Border.all(),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(35),
                  // color: Color(0xff9b9ca3),
                ),
                child: Image.network(
                  '${baseUrlImage}${listShipmentModel.supplierModel.photo}',
                  height: 20.h,
                  width: 20.w,
                ),
                //  listShipmentModel.status == 'pending'
                //     ? Image.asset('assets/clock.jpg')
                //     : listShipmentModel.status == 'received'
                //         ? Image.asset('assets/done.jpg')
                //         : Image.asset('assets/box icon.png'),
              ),
            ),
            Positioned(
              top: 5.h,
              right: 6.w,
              child: Container(
                height: 6.h,
                width: 12.w,
                decoration: BoxDecoration(
                  color: kCardBackGroundColor,
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: kSecondtColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
