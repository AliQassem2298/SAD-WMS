// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/product_details_page_controller.dart';
import 'package:warehouse_manegment_system/model/helper/api.dart';
import 'package:warehouse_manegment_system/model/models/product_details_by_barcode_model.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({
    super.key,
  });
  // ProductDetailsByBarcodeModel? productDetailsByBarcodeModel;
  @override
  Widget build(BuildContext context) {
    //   return Stack(
    //     clipBehavior: Clip.none,
    //     children: [
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
    //         height: 100.h,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           color: kCardBackGroundColor,
    //           // border: Border.all(),
    //           // boxShadow: [],
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(35),
    //             topRight: Radius.circular(35),
    //           ),
    //           // color: Color(0xff9b9ca3),
    //         ),
    //         child: ListView(
    //           children: [
    //             Text(
    //               'name: ${productDetailsByBarcodeModel!.name}',
    //               // maxLines: 1,
    //               // overflow: TextOverflow.ellipsis,
    //               style: TextStyle(
    //                 color: kFirstColor,
    //                 fontSize: 5.5.w,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 1.h,
    //             ),
    //             Text(
    //               'description: ${productDetailsByBarcodeModel!.description}',
    //               // maxLines: 1,
    //               // overflow: TextOverflow.ellipsis,
    //               style: TextStyle(
    //                 color: kFirstColor,
    //                 fontSize: 5.w,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 1.h,
    //             ),
    //             Text(
    //               'category: ${productDetailsByBarcodeModel!.categoryModel.name}',
    //               // maxLines: 1,
    //               // overflow: TextOverflow.ellipsis,
    //               style: TextStyle(
    //                 color: kFirstColor,
    //                 fontSize: 5.w,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 1.h,
    //             ),
    //             Text(
    //               'category: ${productDetailsByBarcodeModel!.supplierModel.name}',
    //               // maxLines: 1,
    //               // overflow: TextOverflow.ellipsis,
    //               style: TextStyle(
    //                 color: kFirstColor,
    //                 fontSize: 5.w,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 1.h,
    //             ),
    //             Text(
    //               'barcode: ${productDetailsByBarcodeModel!.barcode}',
    //               style: TextStyle(
    //                 color: kFirstColor,
    //                 fontSize: 5.w,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 1.h,
    //             ),
    //             Text(
    //               'price: ${productDetailsByBarcodeModel!.price}' + r'$',
    //               style: TextStyle(
    //                 color: kFirstColor,
    //                 fontSize: 5.w,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 1.h,
    //             ),
    //           ],
    //         ).paddingOnly(left: 10.w),
    //       ),
    //       Positioned(
    //         top: 25.h,
    //         left: 5.w,
    //         child: Container(
    //             height: 8.h,
    //             width: 15.w,
    //             decoration: BoxDecoration(
    //               // border: Border.all(),
    //               // boxShadow: [],
    //               borderRadius: BorderRadius.circular(35),
    //               // color: Color(0xff9b9ca3),
    //             ),
    //             // child: listAllOrdersModel.status == 'pending'
    //             // ?
    //             child: Image.network(
    //               '$baseUrlImage${productDetailsByBarcodeModel!.photo}',
    //               height: 8.h,
    //               width: 15.w,
    //             )
    //             // : listAllOrdersModel.status == 'approved'
    //             //     ? Image.asset(
    //             //         'assets/done.png',
    //             //         height: 8.h,
    //             //         width: 15.w,
    //             //       )
    //             //     : Image.asset(
    //             //         'assets/cancelled.png',
    //             //         height: 8.h,
    //             //         width: 15.w,
    //             //       ),
    //             ),
    //       ),
    //     ],
    //   );

    return GetBuilder<ProductDetailsPageController>(
      init: ProductDetailsPageController(),
      builder: (controller) {
        controller.productDetails = ModalRoute.of(context)!.settings.arguments
            as ProductDetailsByBarcodeModel;
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Product Details',
                style: TextStyle(color: kWhiteColor),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      kFirstColor,
                      kFirstColor2,
                    ],
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        kFirstColor,
                        kFirstColor2,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2.h,
                  left: 2.w,
                  child: Container(
                    width: 90.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.5.w,
                      ),
                      children: [
                        Text(
                          '${controller.productDetails!.price}' + r'$',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 5.5.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${controller.productDetails!.name}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 6.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingOnly(top: 2.h),
                        Row(
                          children: [
                            Text(
                              'Supplier:',
                              style: TextStyle(
                                color: kFirstColor2,
                                fontSize: 5.w,
                              ),
                            ),
                            Text(
                              ' ${controller.productDetails!.supplierModel.name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.w,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 2.h),
                        Row(
                          children: [
                            Text(
                              'Category:',
                              style: TextStyle(
                                color: kFirstColor2,
                                fontSize: 5.w,
                              ),
                            ),
                            Text(
                              ' ${controller.productDetails!.categoryModel.name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.w,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 2.h),
                        Text(
                          '${controller.productDetails!.description}',
                          style: TextStyle(
                            color: Color.fromARGB(100, 0, 0, 0),
                            fontSize: 5.w,
                          ),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ).paddingOnly(top: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Barcode:',
                              style: TextStyle(
                                color: kFirstColor2,
                                fontSize: 5.w,
                              ),
                            ),
                            Text(
                              ' ${controller.productDetails!.barcode}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.w,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 3.h),
                      ],
                    ).paddingOnly(top: 8.h),
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 2.w,
                  child: Container(
                    width: 60.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    child: Image.network(
                      '${baseUrlImage}${controller.productDetails!.photo}',
                      width: 60.w,
                      height: 40.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
