// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomShipmentCard extends StatelessWidget {
  CustomShipmentCard({
    required this.supplierName,
    required this.status,
    super.key,
  });
  String supplierName, status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            height: 125,
            width: double.infinity,
            decoration: BoxDecoration(
              // border: Border.all(),
              // boxShadow: [],
              borderRadius: BorderRadius.circular(35),
              color: Color(0xff9b9ca3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.local_shipping,
                //   color: Colors.white,
                //   size: 110,
                // ),
                Text(
                  'Shipment from (${supplierName})',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Status :${status}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              // child:
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(
                // border: Border.all(),
                // boxShadow: [],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                color: Colors.black,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(130, 255, 255, 255),
                    Colors.white38,
                    Colors.white24,
                    const Color.fromARGB(1, 255, 255, 255),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
