// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/Models/ProductsModel.dart';
import 'package:warehouse_manegment_system/customer/screens/Details%20Product/DetailsProducts.dart';

bool isFaClickedPublic = false;

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
  });
  final GetProductsModel products;

  @override
  Widget build(BuildContext context) {
    // GetProductsModel categoryHome_Model =
    //     ModalRoute.of(context)!.settings.arguments as GetProductsModel ;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 160,
      child: InkWell(
        onTap: () {
          Get.to(() => DetailsProducts(
                productid: products.id,
              ));
        },
        child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                height: 136,
                decoration: BoxDecoration(
                    boxShadow: const [Defaultshadow],
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.grey.shade300),
                    color: Color.fromARGB(255, 188, 183, 183)),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: BorderRadius.circular(22)),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 180,
                    width: 180,
                    child: Image.network(
                      'http://10.0.2.2:8000${products.photo}',
                      // fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 136,
                    width: size.width - 200,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              products.name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Tdefaultpadding * 1.5,
                                vertical: Tdefaultpadding / 4),
                            decoration: const BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(22),
                                    topRight: Radius.circular(22))),
                            child: Text(
                              '\$${products.price}',
                              style: const TextStyle(
                                  color: whitecolor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ]),
                  )),
            ]),
      ),
    );
  }
}
