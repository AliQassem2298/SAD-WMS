// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/FavouriteModel/Top_10_FavouriteModel.dart';

import '../../Services/Favourite_Services/TopFavourite.dart';

// ignore: camel_case_types
class ListView_TopFavourite extends StatelessWidget {
  const ListView_TopFavourite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetTopFavouriteService().gettopFavorite(context: context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TopFavouriteModel> data = snapshot.data!;
            return data.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => Card(
                              elevation: 8,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        child: Image.network(
                                          'http://10.0.2.2:8000${data[index].product_photo}',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Text(
                                                data[index].product_name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                ),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${data[index].product_price}',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  )
                : const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            "there is no favorite ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff003A71),
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: const Center(
              child: CircularProgressIndicator(
                color: Color(0xff88BFDD),
              ),
            ),
          );
        });
  }
}
