// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/product_details_by_barcode_model.dart';

class CustomDetailsProductDialog extends StatelessWidget {
  CustomDetailsProductDialog({
    super.key,
    required this.productDetailsByBarcodeModel,
  });
  ProductDetailsByBarcodeModel? productDetailsByBarcodeModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kCardBackGroundColor,
            // border: Border.all(),
            // boxShadow: [],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            // color: Color(0xff9b9ca3),
          ),
          child: ListView(
            children: [
              Text(
                'name: ${productDetailsByBarcodeModel!.name}',
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
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
                'description: ${productDetailsByBarcodeModel!.description}',
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
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
                'category: ${productDetailsByBarcodeModel!.categoryModel.name}',
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
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
                'category: ${productDetailsByBarcodeModel!.supplierModel.name}',
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
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
                'barcode: ${productDetailsByBarcodeModel!.barcode}',
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
                'price: ${productDetailsByBarcodeModel!.price}' + r'$',
                style: TextStyle(
                  color: kFirstColor,
                  fontSize: 5.w,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ).paddingOnly(left: 10.w),
        ),
        Positioned(
          top: 25.h,
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
              // child: listAllOrdersModel.status == 'pending'
              // ?
              child: Image.network(
                '$baseUrlImage${productDetailsByBarcodeModel!.photo}',
                height: 8.h,
                width: 15.w,
              )
              // : listAllOrdersModel.status == 'approved'
              //     ? Image.asset(
              //         'assets/done.png',
              //         height: 8.h,
              //         width: 15.w,
              //       )
              //     : Image.asset(
              //         'assets/cancelled.png',
              //         height: 8.h,
              //         width: 15.w,
              //       ),
              ),
        ),
      ],
    );
  }
}
