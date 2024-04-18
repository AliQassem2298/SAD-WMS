// // ignore_for_file: library_private_types_in_public_api, must_be_immutable, avoid_print

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:warehouse_manegment_system/controller/custom_row_controller.dart';
// import 'package:warehouse_manegment_system/controller/forget_password_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
// import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';
// import 'package:warehouse_manegment_system/model/models/user_model.dart';
// import 'package:warehouse_manegment_system/model/services/get_user_details__by_id_service.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
// import 'package:warehouse_manegment_system/view/widgets/custom_row.dart';

// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/controller/change_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/update_user_details_controller.dart';
import 'package:warehouse_manegment_system/model/models/sign_in_model.dart';
import 'package:warehouse_manegment_system/model/models/user_model.dart';
import 'package:warehouse_manegment_system/model/services/get_user_details__by_token_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(
      init: ProfilePageController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff2B1836),
                    Color(0xff591C3C),
                    Color(0xff911C3A),
                    Color(0xffBB1636)
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xff2B1836),
                          Color(0xff591C3C),
                          Color(0xff911C3A),
                          Color(0xffBB1636)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 50, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Welcome',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Get.toNamed(HomePageController.id);
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Profile Page',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
                      child: FutureBuilder<UserModel>(
                        future: userToken != null
                            ? GetUserDetailsByTokenService()
                                .getUserDetailsByToken()
                            : Future.error(
                                'You are gest 😒😅 \n you don\'t have an account',
                              ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          } else if (snapshot.hasData && userToken != null) {
                            controller.userModel = snapshot.data!;

                            return ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 25,
                              ),
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  'First Name: ${controller.userModel!.firstName}',
                                  style: const TextStyle(
                                    color: Color(0xffBB1636),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Last Name: ${controller.userModel!.lastName}',
                                  style: const TextStyle(
                                    color: Color(0xffBB1636),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'username: ${controller.userModel!.username}',
                                  style: const TextStyle(
                                    color: Color(0xffBB1636),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Email: ${controller.userModel!.email}',
                                  style: const TextStyle(
                                    color: Color(0xffBB1636),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Role: ${controller.userModel!.role}',
                                  style: const TextStyle(
                                    color: Color(0xffBB1636),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.only(left: 175),
                                  child: InkWell(
                                    child: const Text(
                                      'Change Your Password',
                                      style: TextStyle(
                                        color: Color(0xff2B1836),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(
                                        ChangePasswordPageController.id,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.symmetric(),
                                  child: CustomButton(
                                    onPressed: () {
                                      Get.toNamed(
                                        UpdateUserDetailsController.id,
                                        arguments: controller.userModel,
                                      );
                                    },
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Color(0xff2B1836),
                                        Color(0xff591C3C),
                                        Color(0xff911C3A),
                                        Color(0xffBB1636),
                                      ],
                                    ),
                                    text: 'Update User Details',
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
//       body: GetBuilder<ProfilePageController>(
//         init: ProfilePageController(),
//         builder: (controller) {
//           return Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.centerRight,
//                 end: Alignment.centerLeft,
//                 colors: [
//                   Color(0xff2B1836),
//                   Color(0xff591C3C),
//                   Color(0xff911C3A),
//                   Color(0xffBB1636)
//                 ],
//               ),
//             ),
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.centerRight,
//                       end: Alignment.centerLeft,
//                       colors: [
//                         Color(0xff2B1836),
//                         Color(0xff591C3C),
//                         Color(0xff911C3A),
//                         Color(0xffBB1636)
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Welcome',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 32,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               Get.back();
//                             },
//                             icon: const Icon(
//                               Icons.password,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Text(
//                         'Profile Page',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 32,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 700),
//                     height: controller.containerHeight,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(45),
//                       ),
//                       color: Colors.white,
//                     ),
//                     child: GetBuilder<CustomRowController>(
//                       init: CustomRowController(),
//                       builder: (controller) {
//                         return FutureBuilder<UserModel>(
//                           future: userToken != null
//                               ? GetUserDetailsByIdService().getUserDetailsById()
//                               : Future.error(
//                                   'You are gest 😒😅 \n you don\'t have an account',
//                                 ),
//                           builder: (context, snapshot) {
//                             try {
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return const Center(
//                                   child: CircularProgressIndicator(),
//                                 );
//                               } else if (snapshot.hasError) {
//                                 return Center(
//                                   child: Text(
//                                     snapshot.error.toString(),
//                                     style: const TextStyle(fontSize: 18),
//                                   ),
//                                 );
//                               } else if (snapshot.hasData) {
//                                 UserModel userModel = snapshot.data!;
//                                 return ListView(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 25,
//                                     vertical: 25,
//                                   ),
//                                   children: [
//                                     CustomRow(
//                                       text: userModel.firstName,
//                                       hintText: 'Enter Your First Name',
//                                       userModel: userModel,
//                                     ),
//                                     CustomRow(
//                                       text: userModel.lastName,
//                                       hintText: 'Enter Your Last Name',
//                                       userModel: userModel,
//                                     ),
//                                     CustomRow(
//                                       text: userModel.email,
//                                       hintText: 'Enter Email',
//                                       userModel: userModel,
//                                     ),
//                                     CustomRow(
//                                       text: userModel.username,
//                                       hintText: 'Enter User Name',
//                                       userModel: userModel,
//                                     ),
//                                     CustomRow(
//                                       text: userModel.role,
//                                       hintText: 'Enter Your Role',
//                                       userModel: userModel,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 25),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           InkWell(
//                                             onTap: () {
//                                               Get.toNamed(
//                                                   ForgetPasswordPageController
//                                                       .id);
//                                             },
//                                             child: const Text(
//                                               'Change Your Password',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Color(0xff2B1836),
//                                               ),
//                                             ),
//                                           ),
//                                           // const CustomButton(
//                                           //   text: 'Edit',
//                                           //   gradient: LinearGradient(
//                                           //     colors: [
//                                           //       Color(0xff2B1836),
//                                           //       Color(0xff591C3C),
//                                           //       Color(0xff911C3A),
//                                           //       Color(0xffBB1636)
//                                           //     ],
//                                           //     begin: Alignment.centerRight,
//                                           //     end: Alignment.centerLeft,
//                                           //   ),
//                                           // ),
//                                           IconButton(
//                                             onPressed: controller.toggleEditing,
//                                             icon: controller.isEditing
//                                                 ? const Icon(
//                                                     Icons.done,
//                                                     color: Color(0xffBB1636),
//                                                   )
//                                                 : const Icon(
//                                                     Icons
//                                                         .auto_fix_high_outlined,
//                                                     color: Color(0xff591C3C),
//                                                   ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                         right: 150,
//                                       ),
//                                       child: CustomButton(
//                                         routeName: WelcomePageController.id,
//                                         text: 'Delete Account',
//                                         hasBorder: true,
//                                         textColor: const Color(0xffBB1636),
//                                         dialogTitle: 'Account Deleted',
//                                         dialogContent: 'Successfully',
//                                         dialogButtonText: 'OK',
//                                         gradient: const LinearGradient(
//                                           colors: [
//                                             Colors.white,
//                                             Colors.white,
//                                           ],
//                                           begin: Alignment.centerRight,
//                                           end: Alignment.centerLeft,
//                                         ),
//                                       ),
//                                     ),
//                                     const Padding(
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 15,
//                                         vertical: 25,
//                                       ),
//                                       child: CustomButton(
//                                         text: 'Save Changes',
//                                         hasBorder: true,
//                                         borderColor: Colors.white,
//                                         textColor: Colors.white,
//                                         gradient: LinearGradient(
//                                           colors: [
//                                             Color(0xff2B1836),
//                                             Color(0xff591C3C),
//                                             Color(0xff911C3A),
//                                             Color(0xffBB1636)
//                                           ],
//                                           begin: Alignment.centerRight,
//                                           end: Alignment.centerLeft,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               } else {
//                                 return const Center(
//                                   child: Text('No data available'),
//                                 );
//                               }
//                             } catch (e) {
//                               // Handle any other errors
//                               print('Error: $e');
//                               return const Center(
//                                 child: Text(
//                                   'An error occurred. Please try again later.',
//                                 ),
//                               );
//                             }
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
