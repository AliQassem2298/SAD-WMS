// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/ShowDetailsOrder.dart';

import '../../../../constans.dart';

Padding CardOrderDetails(GetOrderDetailsModel data) {
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final DateFormat timeFormat = DateFormat('HH:mm:ss');
  DateTime createdAtDateTime = DateTime.parse(data.createdAt);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      color: Colors.grey.shade100,
      elevation: 15,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 232, 229, 229)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Date',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: darkblue),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      dateFormat.format(createdAtDateTime),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Time',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: darkblue),
                  ),
                  Text(
                    timeFormat.format(createdAtDateTime),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Id',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: darkblue),
                  ),
                  Text(
                    '# ${data.id}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
