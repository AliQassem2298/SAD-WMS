import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
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
          backgroundColor: Color(0xFFB0BEC5),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: kSecondtColor,
            title: Text(
              'Shipments Page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomShipmentCard(
                    supplierName: 'Ali',
                    status: 'pending',
                    image: 'assets/clock icon.png',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomShipmentCard(
                    supplierName: 'Ali',
                    status: 'pending',
                    image: 'assets/box icon.png',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(SupplierShipmentPagController.id);
                  },
                  child: CustomShipmentCard(
                    supplierName: 'Ali',
                    status: 'pending',
                    image: 'assets/true icon.png',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // InkWell(
                //   onTap: () {},
                //   child: CustomShipmentCard(
                //     supplierName: 'Ali',
                //     status: 'pending',
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
