// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/Services/CompanyServices.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Companies/cardallcompany.dart';
import '../../../Models/CompanyModel.dart';

// ignore: camel_case_types
class All_InCompanies extends StatelessWidget {
  const All_InCompanies({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkblue,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text(
            'Companies',
            style: TextStyle(
                color: whitecolor, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: FutureBuilder<List<Company_Model>>(
                        future: GetcompanyService().getcompany(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Company_Model> companies = snapshot.data!;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.5,
                                    crossAxisSpacing: 60,
                                    mainAxisSpacing: 10,
                                    // mainAxisExtent: 200,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: companies.length,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Card_Company(
                                      company: companies[index],
                                    );
                                  }),
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
                        })))
          ],
        ));
  }
}
