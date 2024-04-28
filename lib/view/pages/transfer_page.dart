import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/transfer_page_controller.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferPageController>(
      init: TransferPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tranfer Page'),
          ),
        );
      },
    );
  }
}
