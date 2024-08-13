// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/staff/controller/cutom_drop_list_controller.dart';

class CustomDropList extends StatelessWidget {
  final List<String> options;
  final String? Function(String?)? validator;
  TextEditingController textEditingController = TextEditingController();
  String text;
  CustomDropList({
    Key? key,
    this.validator,
    required this.textEditingController,
    required this.options,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomDropListController>(
      init: CustomDropListController(),
      builder: (controller) {
        return DropdownButtonFormField<String>(
          validator: validator,
          padding: const EdgeInsets.only(top: 20),
          value: controller.selectedOption.isNotEmpty
              ? controller.selectedOption.value
              : null,
          hint: Text(
            text,
            style: TextStyle(color: kFirstColor2),
          ),
          onChanged: (String? newValue) {
            textEditingController.text = newValue!;
            controller.setSelectedOption(newValue);
          },
          style: const TextStyle(
            color: kFirstColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          dropdownColor: Colors.white,
          elevation: 2,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: kFirstColor,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:warehouse_manegment_system/controllers/cutom_drop_list_controller.dart';

// class CustomDropList extends StatelessWidget {
//   final String option1;
//   final String option2;
//   final String? Function(String?)? validator; // Validator function

//   const CustomDropList({
//     Key? key,
//     required this.option1,
//     required this.option2,
//     this.validator, // Accepts validator function
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CustomDropListController>(
//       init: CustomDropListController(),
//       builder: (controller) {
//         return DropdownButtonFormField<String>(
//           validator: validator, // Assign the validator function
//           decoration: InputDecoration(
//             errorStyle: TextStyle(color: Colors.red),
//             hintText: 'Select Your Account',
//             hintStyle: TextStyle(color: Colors.grey),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           value: controller.selectedOption.isNotEmpty
//               ? controller.selectedOption.value
//               : null,
//           onChanged: (String? newValue) {
//             controller.setSelectedOption(newValue!);
//           },
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//           dropdownColor: Colors.white,
//           elevation: 2,
//           items: <String>[
//             option1,
//             option2,
//           ].map(
//             (String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(
//                   value,
//                   style: const TextStyle(
//                     color: Color(0xffBB1636),
//                   ),
//                 ),
//               );
//             },
//           ).toList(),
//         );
//       },
//     );
//   }
// }
