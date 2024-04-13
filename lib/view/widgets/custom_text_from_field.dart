// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField({
    Key? key,
    this.icon,
    this.keyboardType,
    required this.text,
    required this.hintText,
    required this.toggleVisibility,
    required this.validator,
    required this.textEditingController,
    required this.onChanged,
  }) : super(key: key);

  final String text;
  final String hintText;
  TextInputType? keyboardType = TextInputType.none;
  final Widget? icon;
  final bool toggleVisibility;
  final String? Function(String?) validator;
  final void Function(String) onChanged;
  TextEditingController textEditingController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool showError = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: toggleVisibility ? !isPasswordVisible.value : false,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: icon != null
              ? IconButton(
                  onPressed: () {
                    if (toggleVisibility) {
                      isPasswordVisible.toggle();
                    } else {
                      // Handle the case when the icon is not provided
                    }
                  },
                  icon: toggleVisibility
                      ? (isPasswordVisible.value
                          ? const Icon(
                              Icons.visibility,
                              color: Color(0xff591C3C),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Color(0xff591C3C),
                            ))
                      : icon!,
                  color: const Color(0xff591C3C),
                )
              : null,
          hintText: hintText,
          labelText: text,
          labelStyle: const TextStyle(
            color: Color(0xffBB1636),
          ),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          errorText:
              showError.value ? validator(textEditingController.text) : null,
        ),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////
// // ignore_for_file: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:warehouse_manegment_system/controller/custom_text_field_controller.dart';

// class CustomTextFromField extends StatelessWidget {
//   CustomTextFromField({
//     Key? key,
//     this.icon,
//     this.keyboardType,
//     required this.text,
//     required this.hintText,
//     required this.toggleVisibility,
//     required this.validator,
//     required this.controller,
//     this.onChanged,
//   }) : super(key: key);

//   final String text;
//   final String hintText;
//   TextInputType? keyboardType = TextInputType.none;
//   final Widget? icon;
//   final bool toggleVisibility;
//   final String? Function(String?) validator;
//   final CustomTextFiledController controller;
//   final void Function(String)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller.textEditingController,
//       keyboardType: keyboardType,
//       obscureText:
//           toggleVisibility ? !controller.isPasswordVisible.value : false,
//       validator: validator,
//       onChanged: (value) {
//         controller.showError.value = false;
//         if (onChanged != null) {
//           onChanged!(value);
//         }
//       },
//       decoration: InputDecoration(
//         suffixIcon: icon != null
//             ? IconButton(
//                 onPressed: () {
//                   if (toggleVisibility) {
//                     controller.isPasswordVisible.toggle();
//                   } else {
//                     // Handle the case when the icon is not provided
//                   }
//                 },
//                 icon: toggleVisibility
//                     ? (controller.isPasswordVisible.value
//                         ? const Icon(
//                             Icons.visibility,
//                             color: Color(0xff591C3C),
//                           )
//                         : const Icon(
//                             Icons.visibility_off,
//                             color: Color(0xff591C3C),
//                           ))
//                     : icon!,
//                 color: const Color(0xff591C3C),
//               )
//             : null,
//         hintText: hintText,
//         labelText: text,
//         labelStyle: const TextStyle(
//           color: Color(0xffBB1636),
//         ),
//         border: UnderlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         errorText: controller.showError.value
//             ? validator(controller.textEditingController.text)
//             : null,
//       ),
//       style: const TextStyle(
//         color: Colors.black,
//       ),
//     );
//   }
// }
///////////////////////////////////////////////////////////////////////

////// the stateless widget with on changed
 

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTextFromField extends StatelessWidget {
//   CustomTextFromField({
//     Key? key,
//     this.icon,
//     this.keyboardType,
//     required this.text,
//     required this.hintText,
//     required this.toggleVisibility,
//     required this.validator,
//     required TextEditingController textEditingController,
//   })  : textEditingController = textEditingController,
//         super(key: key);

//   final String text;
//   final String hintText;
//   TextInputType? keyboardType = TextInputType.none;
//   final Widget? icon;
//   final bool toggleVisibility;
//   final String? Function(String?) validator;

//   final TextEditingController textEditingController;
//   final RxBool isPasswordVisible = false.obs;
//   final RxBool showError = false.obs;

//   void onChanged(String value) {
//     showError.value = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => TextFormField(
//         controller: textEditingController,
//         keyboardType: keyboardType,
//         obscureText: toggleVisibility ? !isPasswordVisible.value : false,
//         validator: validator,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           suffixIcon: icon != null
//               ? IconButton(
//                   onPressed: () {
//                     if (toggleVisibility) {
//                       isPasswordVisible.toggle();
//                     } else {
//                       // Handle the case when the icon is not provided
//                     }
//                   },
//                   icon: toggleVisibility
//                       ? (isPasswordVisible.value
//                           ? const Icon(
//                               Icons.visibility,
//                               color: Color(0xff591C3C),
//                             )
//                           : const Icon(
//                               Icons.visibility_off,
//                               color: Color(0xff591C3C),
//                             ))
//                       : icon!,
//                   color: const Color(0xff591C3C),
//                 )
//               : null,
//           hintText: hintText,
//           labelText: text,
//           labelStyle: const TextStyle(
//             color: Color(0xffBB1636),
//           ),
//           border: UnderlineInputBorder(
//             borderSide: const BorderSide(color: Colors.black),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           errorText:
//               showError.value ? validator(textEditingController.text) : null,
//         ),
//         style: const TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }
