import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Category/productsbysupplier.dart';
import '../../../Models/CompanyModel.dart';

// ignore: camel_case_types
class Card_Company extends StatelessWidget {
  const Card_Company({super.key, required this.company});
  final Company_Model company;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 170,
      child: InkWell(
        onTap: () {
          Get.to(
              () => ProductsBySupplier(
                    product_id: company.id,
                  ),
              arguments: company);
        },
        child: Card(
          shadowColor: darkgreycolor,
          elevation: 14,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                'http://10.0.2.2:8000${company.photo}',
                height: 150,
                width: 150,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                child: Center(
                  child: Text(
                    company.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
