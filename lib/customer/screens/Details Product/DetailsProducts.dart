// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/screens/Details%20Product/BodyDetails.dart';

import '../../../constans.dart';
import '../../Models/ProductsModel.dart';
import '../../Services/ListProductsService.dart';

class DetailsProducts extends StatelessWidget {
  const DetailsProducts({
    super.key,
    required this.productid,
  });
  final int productid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkblue,
        appBar: AppBar(
          backgroundColor: darkblue,
          elevation: 0,
          leading: IconButton(
              padding: const EdgeInsets.only(left: Tdefaultpadding),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: whitecolor,
              )),
          centerTitle: false,
        ),
        body: FutureBuilder<GetProductsModel>(
            future: GetProductsService().getproducts(id: productid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                GetProductsModel detail = snapshot.data!;
                return bodyDetails(
                  product: detail,
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff88BFDD),
                    ),
                  ),
                );
              }
            })
        // bodyDetails(),
        );
  }
}
