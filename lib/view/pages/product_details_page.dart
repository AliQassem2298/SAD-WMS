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

                      // kSecondtColor,
                      // kThierdColor,
                      // kFourthColor,
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.w,
                    top: 2.h,
                    right: 6.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.productDetails!.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 5.5.w,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Price:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 6.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${controller.productDetails!.price}' + r'$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 5.5.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 65.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                      color: Colors.white,
                    ),
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.5.w,
                        vertical: 5.h,
                      ),
                      children: [
                        Row(
                          children: [
                            Text(
                              'Supplier:',
                              style: TextStyle(
                                color: kFirstColor2,
                                fontSize: 6.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' ${controller.productDetails!.supplierModel.name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.5.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 8.h),
                        Row(
                          children: [
                            Text(
                              'Category:',
                              style: TextStyle(
                                color: kFirstColor2,
                                fontSize: 6.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' ${controller.productDetails!.categoryModel.name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.5.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 1.h),
                        Text(
                          'Description:',
                          style: TextStyle(
                            color: kFirstColor2,
                            fontSize: 6.w,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ).paddingOnly(top: 1.h),
                        Text(
                          '${controller.productDetails!.description}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 5.5.w,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ).paddingOnly(top: 1.h),

                        Row(
                          children: [
                            Text(
                              'Barcode:',
                              style: TextStyle(
                                color: kFirstColor2,
                                fontSize: 6.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' ${controller.productDetails!.barcode}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 5.5.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 1.h),
                        // CustomTextFromField(
                        //   onChanged: (value) {
                        //     controller.email.text = value;
                        //   },
                        //   textEditingController: controller.email,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Field is empty';
                        //     }
                        //     return null;
                        //   },
                        //   hintText: 'Enter Your Email Or User Name',
                        //   text: 'Email/Username',
                        //   toggleVisibility: false,
                        // ),
                        // SizedBox(height: 2.h),
                        // CustomTextFromField(
                        //   onChanged: (value) {
                        //     controller.password.text = value;
                        //   },
                        //   textEditingController: controller.password,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Field is empty';
                        //     }
                        //     if (value.length < 7) {
                        //       return 'Password is too short';
                        //     }
                        //     return null;
                        //   },
                        //   hintText: 'Enter Your Password',
                        //   text: 'Password',
                        //   icon: const Icon(Icons.remove_red_eye),
                        //   toggleVisibility: true,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 2.h),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           Get.toNamed(
                        //             ForgetPasswordPageController.id,
                        //           );
                        //         },
                        //         child: const Text(
                        //           'Forget Password?',
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             color: kFirstColor,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 5.w,
                        //     vertical: 5.h,
                        //   ),
                        //   child: CustomButton(
                        //     onPressed: () async {
                        //       if (controller.formState.currentState!
                        //           .validate()) {
                        //         controller.loadingIndecatorTrue();

                        //         try {
                        //           await controller.signIn(controller);
                        //           print('Success');
                        //           controller.loadingIndecatorFalse();
                        //           Get.snackbar(
                        //             'Hi',
                        //             'Sign in successful',
                        //           );
                        //           Get.toNamed(
                        //             HomePageWithDrawerController.id,
                        //           );
                        //         } catch (e) {
                        //           print(e.toString());
                        //           Get.snackbar(
                        //             'Sorry',
                        //             e.toString(),
                        //             colorText: Colors.white,
                        //           );
                        //         }
                        //         controller.loadingIndecatorFalse();
                        //       }
                        //     },
                        //     text: 'SIGN IN',
                        //     hasBorder: true,
                        //     gradient: const LinearGradient(
                        //       colors: [
                        //         kFirstColor,
                        //         kFirstColor2,
                        //       ],
                        //       end: Alignment.topLeft,
                        //       begin: Alignment.bottomRight,
                        //     ),
                        //     routeName: HomePageWithDrawerController.id,
                        //   ),
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     const Text('Don\'t have an account?'),
                        //     InkWell(
                        //       onTap: () {
                        //         Get.offAllNamed(SignUpPageController.id);
                        //       },
                        //       child: const Text(
                        //         'Sign Up',
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 25.h,
                  right: 0.w,
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Color(0x30444444),
                    //   borderRadius: BorderRadius.circular(100),
                    //   border:
                    //       Border.all(width: 0.3.w, color: Color(0xFF444444)),
                    // ),
                    width: 40.w,
                    height: 20.h,
                    child: Image.network(
                      '${baseUrlImage}${controller.productDetails!.photo}',
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
