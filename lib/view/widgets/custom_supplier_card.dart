import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/constans.dart';

class CustomSupplierCard extends StatelessWidget {
  const CustomSupplierCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 75),
      child: InkWell(
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 190,
              width: 180,
              decoration: BoxDecoration(
                color: kCardBackGroundColor,
                // border: Border.all(),
                // boxShadow: [],
                borderRadius: BorderRadius.circular(35),
                // color: Color(0xff9b9ca3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Icon(
                  //   Icons.local_shipping,
                  //   color: Colors.white,
                  //   size: 110,
                  // ),

                  Text(
                    'name: cap',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'quantity: 80',
                    style: TextStyle(
                      color: kFirstColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'status: pending',
                        style: TextStyle(
                          color: kFirstColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.watch_later_outlined,
                        size: 20,
                      )

                      // Image.asset(
                      //   'assets/clock icon.png',
                      //   width: 20,
                      //   height: 20,
                      //   color: kFirstColor,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -50,
              left: 40,
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  // color: kSecondtColor,
                  border: Border.all(color: kSecondtColor, width: 3),
                  // boxShadow: [],
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/nwms.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
