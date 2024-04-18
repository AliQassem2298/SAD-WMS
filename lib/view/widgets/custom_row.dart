// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:warehouse_manegment_system/controller/custom_row_controller.dart';
// import 'package:warehouse_manegment_system/model/models/user_model.dart';

// class CustomRow extends StatelessWidget {
//   final String text;
//   final String hintText;
//   UserModel? userModel;
//   CustomRow({
//     super.key,
//     required this.text,
//     required this.hintText,
//     required this.userModel,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CustomRowController>(
//       init: CustomRowController(),
//       builder: (controller) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Visibility(
//               visible: !controller.isEditing,
//               child: Text(
//                 controller.enteredText.isNotEmpty
//                     ? controller.enteredText
//                     : text,
//                 style: const TextStyle(
//                   color: Color(0xffBB1636),
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: controller.isEditing,
//               child: Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: TextField(
//                     onSubmitted: (text) {
//                       controller.toggleEditing();
//                       // saveChanges();
//                     },
//                     onChanged: controller.updateEnteredText,
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       border: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(25),
//                         ),
//                       ),
//                       enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(25),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
