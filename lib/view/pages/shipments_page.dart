import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_shipment_card.dart';

class ShipmentsPage extends StatelessWidget {
  const ShipmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShipmentsPageController>(
      init: ShipmentsPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Shipments Page'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomShipmentCard(
                    supplierName: 'Ali',
                    status: 'pending',
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CustomShipmentCard(
                    supplierName: 'Ali',
                    status: 'pending',
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
