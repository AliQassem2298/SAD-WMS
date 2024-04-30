import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_supplier_card.dart';

class SupplierShipmentPag extends StatelessWidget {
  const SupplierShipmentPag({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierShipmentPagController>(
      init: SupplierShipmentPagController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFB0BEC5),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Supplier\'s Shipment',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: kSecondtColor,
          ),
          body: Stack(
            children: [
              GridView.builder(
                itemBuilder: (context, index) {
                  return CustomSupplierCard();
                },
                padding: EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 5,
                  childAspectRatio: 5 / 6.5,
                ),
                // children: [
                //   CustomSupplierCard(),
                //   CustomSupplierCard(),
                //   CustomSupplierCard()
                // ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 125,
                  width: 400,
                  decoration: BoxDecoration(
                    color: kBackGroundColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 33),
                  child: CustomButton(
                    hasBorder: true,
                    borderColor: Colors.transparent,
                    onPressed: () {},
                    text: 'Scan',
                    fontSize: 24,
                    textColor: Colors.white,
                    gradient: const LinearGradient(
                      colors: [
                        kSecondtColor,
                        kSecondtColor,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
