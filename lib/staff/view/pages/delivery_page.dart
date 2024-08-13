import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/delivery_page._controller.dart';
import 'package:warehouse_manegment_system/staff/controller/orders_for_delivery_page_controller.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_drop_list.dart';
import 'package:warehouse_manegment_system/staff/view/widgets/custom_text_from_field.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryPageController>(
      init: DeliveryPageController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Delivery Page',
                style: TextStyle(color: kWhiteColor),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              //
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    height: controller.containerHeight,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                      color: Colors.white,
                    ),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.5.w,
                          vertical: 5.h,
                        ),
                        children: [
                          CustomDropList(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select an company';
                              }
                              return null;
                            },
                            text: 'Company Name',
                            textEditingController:
                                controller.textEditingController,
                            options: ['FedEx', 'DHL', 'UPS'],
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.deliveryMan.text = value;
                            },
                            textEditingController: controller.deliveryMan,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'field is empty';
                              }

                              return null;
                            },
                            hintText: 'Enter Your Name',
                            text: 'Delivery man',
                            toggleVisibility: false,
                          ),
                          CustomTextFromField(
                            onChanged: (value) {
                              controller.phoneNumber.text = value;
                            },
                            textEditingController: controller.phoneNumber,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'field is empty';
                              }
                              if (value.length < 9) {
                                return 'Number is too short';
                              }

                              return null;
                            },
                            hintText: 'Enter Your Phone Number',
                            text: 'Phone Number',
                            toggleVisibility: false,
                            keyboardType: TextInputType.number,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 5.h,
                            ),
                            child: CustomButton(
                              onPressed: () async {
                                if (controller.formState.currentState!
                                    .validate()) {
                                  controller.loadingIndecatorTrue();

                                  try {
                                    Get.toNamed(
                                      OrdersForDeliveryPageController.id,
                                      arguments: {
                                        'textEditingController':
                                            controller.textEditingController,
                                        'deliveryMan': controller.deliveryMan,
                                        'phoneNumber': controller.phoneNumber,
                                      },
                                    );
                                    // sharedPreferences!
                                    //     .setString("token", userToken!);
                                    print('succsess');
                                    controller.loadingIndecatorFalse();
                                    // print('token=$userToken');
                                    // controller.showSnackBar(
                                    //   context,
                                    //   'Sign in successful',
                                    // );
                                  } catch (e) {
                                    print(e.toString());

                                    // controller.showSnackBar(
                                    //   context,
                                    //   e.toString(),
                                    //   // 'Unable to log in with provided credentials.',
                                    // );
                                    Get.snackbar(
                                      'Sorry',
                                      e.toString(),
                                      colorText: Colors.white,
                                    );
                                  }
                                  controller.loadingIndecatorFalse();
                                }
                              },
                              text: 'Orders',
                              hasBorder: true,
                              gradient: const LinearGradient(
                                colors: [
                                  kFirstColor,
                                  kFirstColor2,
                                  // kThierdColor,
                                  // kFourthColor,
                                ],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ],
                      ),
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
