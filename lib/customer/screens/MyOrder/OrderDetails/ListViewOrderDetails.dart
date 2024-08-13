// ignore_for_file: file_names, unused_local_variable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:warehouse_manegment_system/customer/Models/MyOrderModel/ShowDetailsOrder.dart';
import 'package:warehouse_manegment_system/customer/Services/MrOrderServices/GetShowDetailsOrder.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/OrderDetails/CardItemOrder.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/OrderDetails/CardOrderDetails.dart';
import 'package:warehouse_manegment_system/customer/screens/MyOrder/OrderDetails/cardOrderStatus.dart';

import '../../../../constans.dart';

class ListViewOrderDetails extends StatelessWidget {
  const ListViewOrderDetails({
    super.key,
    required this.orderid,
  });
  final int orderid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetShowOrderDetails().getShowOrderDetails(orderId: orderid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            GetOrderDetailsModel data = snapshot.data!;
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Order Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    CardOrderDetails(data),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                      child: Text(
                        'Order Status',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    OrderStatusCard(
                      data: data,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                      child: Text(
                        'Items',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    CardItemOrder(data),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        'Total Price: \$${data.totalPrice}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: darkblue),
                      ),
                    ),
                  ],
                ));
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
