// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/ShowDetailsOrder.dart';

import '../../../../constans.dart';

Padding CardItemOrder(GetOrderDetailsModel data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Card(
      elevation: 20,
      color: Colors.grey.shade100,
      child: Container(
        height: 200,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 232, 229, 229)),
        child: data.details.isEmpty
            ? const Center(
                child: Text(
                  'No item Found',
                  style: TextStyle(
                    fontSize: 24,
                    color: darkblue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.details.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: whitecolor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: Image.network(
                                    'http://10.0.2.2:8000${data.details[index].product.photo}',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        data.details[index].product.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '\$${data.details[index].product.price}',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
      ),
    ),
  );
}
