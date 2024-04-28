import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/inventory_scan_page_controller.dart';

class InventoryScanPage extends StatelessWidget {
  const InventoryScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryScanPageController>(
      init: InventoryScanPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Inventory Scan Page'),
          ),
        );
      },
    );
  }
}
