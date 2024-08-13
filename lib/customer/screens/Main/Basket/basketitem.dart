import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/customer/Models/BasketModel/BasketModel.dart';
import 'package:warehouse_manegment_system/customer/controller/basketcontroller.dart';

class BasketItem extends StatefulWidget {
  const BasketItem({
    Key? key,
    required this.item,
    required this.i,
    required this.onePiecePrice,
  }) : super(key: key);

  final BasketItemModel item;
  final int i;
  final num onePiecePrice;

  @override
  State<BasketItem> createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {
  late BasketController basketController;

  @override
  void initState() {
    super.initState();
    basketController = Get.find<BasketController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    'http://10.0.2.2:8000${widget.item.image}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Text(
                            widget.item.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Open Sans',
                              color: darkblue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${widget.item.price}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      basketController.delete(widget.i);
                      // basketController.clearBasket();
                    },
                    icon: const Icon(
                      size: 25,
                      Icons.delete,
                      color: Colors.black54,
                    ),
                  ),
                  GetBuilder<BasketController>(
                    builder: (controller) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              basketController.decrementItem(widget.i);
                            },
                            icon: const Icon(
                              size: 18,
                              Icons.remove,
                              color: Color(0xff003A71),
                            ),
                          ),
                          Text(
                            '${widget.item.counter}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              basketController.incrementItem(widget.i);
                            },
                            icon: const Icon(
                              size: 18,
                              Icons.add,
                              color: Color(0xff003A71),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: const Color(0xff013a71).withOpacity(.2),
            endIndent: 15,
            indent: 15,
          ),
        ],
      ),
    );
  }
}
