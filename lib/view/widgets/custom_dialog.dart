// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:warehouse_manegment_system/controller/custom_dialog_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/main.dart';
import 'package:warehouse_manegment_system/model/services/delete_account_service.dart';
import 'package:warehouse_manegment_system/view/pages/dialog_page.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_text_from_field.dart';

class MyDialog extends StatelessWidget {
  String? dialogTitle, dialogContent, hintText;
  MyDialog({
    required this.dialogTitle,
    this.dialogContent,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDialogController>(
      init: MyDialogController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            body: AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.delete),
                  // SizedBox(width: 8),
                  Text(dialogTitle ?? ''),
                ],
              ),
              content: Form(
                key: controller.formState,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextFromField(
                      onChanged: (value) {
                        controller.password.text = value;
                      },
                      textEditingController: controller.password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'filed is empty';
                        }
                        return null;
                      },
                      hintText: 'Enter Your Password',
                      text: 'Password',
                      icon: const Icon(Icons.remove_red_eye),
                      toggleVisibility: true,
                    ),
                    IconButton(
                      onPressed: () async {
                        if (controller.formState.currentState!.validate()) {
                          controller.loadingIndecatorTrue();
                          // try {
                          //   await DeleteAccountService()
                          //       .deleteAccount(password: controller.password.text);
                          //   // sharedPreferences!
                          //   //     .setString("token", userToken!);
                          //   print('succsess');
                          //   controller.loadingIndecatorFalse();
                          //   // print('token=$userToken');
                          //   Get.to(
                          //     () => DialogPage(
                          //       routeName: WelcomePageController.id,
                          //       title: 'Account Deleted',
                          //       content: 'Successfully',
                          //       buttonText: 'ok',
                          //     ),
                          //   );
                          // } catch (e) {
                          //   print(e.toString());
                          //   controller.showSnackBar(
                          //     context,
                          //     // e.toString(),
                          //     // 'Unable to log in with provided credentials.',
                          //     'Wrong Password',
                          //   );
                          // }

                          try {
                            await DeleteAccountService().deleteAccount(
                              password: controller.password.text,
                            );
                            sharedPreferences!.clear();

                            print('succsess');
                            controller.loadingIndecatorFalse();

                            Get.to(
                              () => DialogPage(
                                title: 'Account Deleted',
                                buttonText: 'Ok',
                                content: 'Successfully',
                                routeName: WelcomePageController.id,
                              ),
                            );
                          } catch (e) {
                            print(e.toString());
                            controller.showSnackBar(context, 'Invalid Pawword'
                                // e.toString(),
                                );
                          }
                          controller.loadingIndecatorFalse();
                        }
                      },
                      icon: Icon(Icons.done),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
