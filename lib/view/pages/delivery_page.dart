import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/delivery_page._controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_drop_list.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 25,
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
                              controller.email.text = value;
                            },
                            textEditingController: controller.email,
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
                              controller.password.text = value;
                            },
                            textEditingController: controller.password,
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
                            text: '+963',
                            toggleVisibility: true,
                            keyboardType: TextInputType.number,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 50,
                            ),
                            child: CustomButton(
                              onPressed: () async {
                                if (controller.formState.currentState!
                                    .validate()) {
                                  controller.loadingIndecatorTrue();

                                  try {
                                    // sharedPreferences!
                                    //     .setString("token", userToken!);
                                    print('succsess');
                                    controller.loadingIndecatorFalse();
                                    // print('token=$userToken');
                                    // controller.showSnackBar(
                                    //   context,
                                    //   'Sign in successful',
                                    // );
                                    Get.snackbar(
                                      'Hi',
                                      'Sign in successful',
                                      // colorText: Colors.white,
                                    );
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
                              routeName: HomePageWithDrawerController.id,
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
