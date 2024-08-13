// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/model/models/pick_list_for_order_detail_model.dart';

class CustomSuggestedLocationForOrdersCard extends StatelessWidget {
  PickLocationsModel pickLocationsModel;
  CustomSuggestedLocationForOrdersCard({
    required this.pickLocationsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            kWhiteColor,
            kWhiteColor,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                // horizontal: 15.w,
                vertical: 2.h,
              ),
              height: 25.h,
              width: 45.w,
              decoration: BoxDecoration(
                // color: kCardBackGroundColor,
                border: Border.all(color: kFirstColor2, width: 0.8.w),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Aisle :${pickLocationsModel.aisle}',
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rack :${pickLocationsModel.rack}',
                    style: TextStyle(
                      color: kSecondtColor,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ).paddingOnly(top: 3.5.h),
            ),
            // Positioned(
            //   top: -2.h,
            //   left: 3.w,
            //   child: Container(
            //     height: 20.h,
            //     width: 20.w,
            //     decoration: BoxDecoration(
            //       // border: Border.all(),
            //       // boxShadow: [],
            //       borderRadius: BorderRadius.circular(35),
            //       // color: Color(0xff9b9ca3),
            //     ),
            //     // child: Image.network(
            //     //   '${baseUrlImage}${listShipmentModel.supplierModel.photo}',
            //     //   height: 20.h,
            //     //   width: 20.w,
            //     // )
            //     //  listShipmentModel.status == 'pending'
            //     //     ? Image.asset('assets/clock.jpg')
            //     //     : listShipmentModel.status == 'received'
            //     //         ? Image.asset('assets/done.jpg')
            //     //         : Image.asset('assets/box icon.png'),
            //   ),
            // ),
            Positioned(
              top: 0.h,
              left: 0.w,
              child: Container(
                height: 6.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: kFirstColor2,
                  border: Border.all(color: kFirstColor2, width: 0.8.w),
                  // boxShadow: [],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${pickLocationsModel.locationName}',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 5.5.w,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              right: 0.w,
              child: Container(
                height: 6.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: kFirstColor2,
                  border: Border.all(color: kFirstColor2, width: 0.8.w),
                  // boxShadow: [],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Text(
                  'Level: ${pickLocationsModel.level}',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingOnly(left: 8.w, top: 0.5.h),
              ),
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
      // child: FutureBuilder<List<ListShipmentModel>>(
      //   future: ListShipmentService().listShipment(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       controller.shipments = snapshot.data!;
      //       return ListView.builder(
      //         itemCount: controller.shipments!.length,
      //         clipBehavior: Clip.none,
      //         itemBuilder: (context, index) {
      //           return CustomShipmentCard(
      //             listShipmentModel: controller.shipments![index],
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      // ),
    );
  }
}
