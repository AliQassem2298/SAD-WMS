import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';

import 'package:warehouse_manegment_system/model/models/list_shipment_model.dart';
import 'package:warehouse_manegment_system/model/services/list_shipment_service.dart';
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
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: kFirstColor2,
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
                  kWhiteColor,
                  kWhiteColor,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
              child: FutureBuilder<List<ListShipmentModel>>(
                future: ListShipmentService().listShipment(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.shipments = snapshot.data!;
                    return ListView.builder(
                      itemCount: controller.shipments!.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        return CustomShipmentCard(
                          listShipmentModel: controller.shipments![index],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
