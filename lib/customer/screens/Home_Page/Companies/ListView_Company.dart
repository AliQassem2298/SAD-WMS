// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Services/CompanyServices.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Companies/CardCompany.dart';
import '../../../Models/CompanyModel.dart';

class ListViewCompany extends StatelessWidget {
  const ListViewCompany({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: FutureBuilder<List<Company_Model>>(
              future: GetcompanyService().getcompany(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Company_Model> companies = snapshot.data!;
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: companies.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                      itemBuilder: (context, index) {
                        return CardCompany(
                          com: companies[index],
                        );
                      });
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
              })),
    );
  }
}
