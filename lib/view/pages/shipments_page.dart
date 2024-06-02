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
          backgroundColor: Colors.white,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
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
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: kFirstColor,
            title: Text(
              'Shipments Page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
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
            child: Padding(
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
                      image: 'assets/clock.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(SupplierShipmentPagController.id);
                  //   },
                  //   child: CustomShipmentCard(
                  //     supplierName: 'Ali',
                  //     status: 'pending',
                  //     image: 'assets/box icon.png',
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 25,
                  // ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(SupplierShipmentPagController.id);
                    },
                    child: CustomShipmentCard(
                      supplierName: 'Ali',
                      status: 'recived',
                      image: 'assets/done.jpg',
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
          ),
        );
      },
    );
  }
}
