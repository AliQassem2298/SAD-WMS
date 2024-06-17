import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/list_shipment_model.dart';
import 'package:warehouse_manegment_system/model/models/shipment_details_model.dart';
import 'package:warehouse_manegment_system/model/services/shipment_details_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_supplier_card.dart';

class SupplierShipmentPag extends StatelessWidget {
  SupplierShipmentPag({super.key});

  @override
  Widget build(BuildContext context) {
    ListShipmentModel products =
        ModalRoute.of(context)!.settings.arguments as ListShipmentModel;
    return GetBuilder<SupplierShipmentPagController>(
      init: SupplierShipmentPagController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              '${products.supplierModel.name.substring(0, 6)}\'s... Shipment',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: kFirstColor2,
          ),
          body: Stack(
            children: [
              // GridView.builder(
              //   itemBuilder: (context, index) {
              //     return CustomSupplierCard().paddingOnly(left: 5, right: 5);
              //   },
              //   padding: EdgeInsets.symmetric(horizontal: 8),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 0,
              //     crossAxisSpacing: 0,
              //     childAspectRatio: 5 / 6.5,
              //   ),
              //   // children: [
              //   //   CustomSupplierCard(),
              //   //   CustomSupplierCard(),
              //   //   CustomSupplierCard()
              //   // ],
              // ),
              FutureBuilder<List<ShipmentDetailsModel>>(
                future:
                    ShipmentDetailsService().shipmentDetails(id: products.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.products = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.h,
                        crossAxisSpacing: 0.w,
                        childAspectRatio: 5.5.w / 4.h,
                      ),
                      itemCount: controller.products!.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        return CustomSupplierCard(
                                shipmentDetailsModel:
                                    controller.products![index])
                            .paddingOnly(left: 1.5.w, right: 1.5.w);
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   child: Container(
              //     height: 100,
              //     width: 400,
              //     decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //         begin: Alignment.centerRight,
              //         end: Alignment.centerLeft,
              //         colors: [
              //           kFirstColor,
              //           kFirstColor2,
              //         ],
              //       ),
              //     ),
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 75, vertical: 25),
              //     child: Column(
              //       children: [
              //         CustomButton(
              //           hasBorder: true,
              //           borderColor: Colors.transparent,
              //           onPressed: () {
              //             barcodeController.scanBarcode();
              //           },
              //           text: 'Scan',
              //           fontSize: 24,
              //           textColor: kSecondtColor,
              //           gradient: const LinearGradient(
              //             colors: [
              //               kWhiteColor,
              //               kWhiteColor,
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Positioned(
              //   bottom: 60,
              //   left: 0,
              //   child: Obx(
              //     () {
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: barcodeController.scannedBarcodes.length,
              //         itemBuilder: (context, index) {
              //           return ListTile(
              //             title: Text(barcodeController.scannedBarcodes[index]),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
