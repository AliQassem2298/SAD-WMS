// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/Models/CategoryModel.dart';
import 'package:warehouse_manegment_system/customer/Services/CategoryServices.dart';
import 'package:warehouse_manegment_system/customer/screens/Home_Page/Category/CardCategory.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<CategoryModell>>(
            future: GetCategryService().getcategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CategoryModell> categories = snapshot.data!;
                return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6, //const
                    padding: const EdgeInsets.symmetric(
                        horizontal: Tdefaultpadding,
                        vertical: Tdefaultpadding / 4),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                    itemBuilder: (context, index) {
                      return CradCategory(
                        category: categories[index],
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
            }));
  }
}
