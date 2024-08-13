// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Category/ListView_Category.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Companies/ListView_Company.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Companies/TextCompanyAndSeeAll.dart';
import 'package:warehouse_manegment_system/customer/screens/Main/Search.dart';

class Body extends StatelessWidget {
  TextEditingController role = TextEditingController();
  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: kFirstColor2,
        // title: Text('Warehouse management system'),
        flexibleSpace: Container(
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
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSizeConfig.blockSizeHorizontal * 4),
            child: Text(
              'S.A.D',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: ScreenSizeConfig.blockSizeHorizontal * 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          // Replacing the IconButton with a read-only TextFormField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              readOnly: true,
              onTap: () {
                showSearch(context: context, delegate: SearchMedicine());
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey[100]!, width: 0.3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey[500]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const ListViewCategory(),
          const SizedBox(
            height: 40,
          ),
          const TextCompanyBody(),
          const ListViewCompany(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
