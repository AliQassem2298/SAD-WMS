// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/customer/controller/basketcontroller.dart';
import 'package:warehouse_manegment_system/customer/screens/Details%20Product/Description_Product.dart';

import '../../../constans.dart';
import '../../Models/BasketModel/BasketModel.dart';
import '../../Models/ProductsModel.dart';
import '../../Services/MrOrderServices/PostOrderServices.dart';
import '../../controller/ProductController.dart';
import '../../controller/myordercontroller.dart';
import 'Category_Supplier.dart';
import 'Favourite.dart';
import 'Product_Title_Image.dart';

num priceForCard = 0;

class bodyDetails extends StatefulWidget {
  const bodyDetails({
    super.key,
    required this.product,
  });
  final GetProductsModel product;

  @override
  State<bodyDetails> createState() => _bodyDetailsState();
}

class _bodyDetailsState extends State<bodyDetails> {
  bool isClicked = false;
  final MyOrdersController myOrdersController = Get.put(MyOrdersController());

  @override
  void initState() {
    super.initState();
    var elementToCheck = {
      'quantity': 1,
      'product_id': widget.product.id,
    };
    isClicked = basketItemsPlaceOrderList1.any(
      (item) =>
          item['quantity'] == elementToCheck['quantity'] &&
          item['product_id'] == elementToCheck['product_id'],
    );
  }

  void _handleBuyNow() async {
    List<BasketItemModel> basketItems = [
      BasketItemModel(
        id: widget.product.id,
        name: widget.product.name,
        price: num.parse(widget.product.price),
        image: widget.product.photo,
        counter: 1,
      ),
    ];

    final PostAddOrderService postAddOrderService = PostAddOrderService();

    try {
      final result = await postAddOrderService.postAddOrderService(basketItems);

      if (!mounted) return;

      if (result['success']) {
        showCustomSnackBar(
            context, 'Order has been Created successfully', true);

        basketItems.clear();
        basketItemsPlaceOrderList1.clear();

        final MyOrdersController myOrdersController =
            Get.find<MyOrdersController>();
        myOrdersController.fetchOrders();
      } else {
        showCustomSnackBar(
            context, 'The Product is Currently Unavailable', false);
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
            context, 'An error occurred: ${e.toString()}', false);
      }
    }
  }

  void showCustomSnackBar(
      BuildContext context, String message, bool isSuccess) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor:
          isSuccess ? Colors.blue : Color.fromARGB(255, 142, 25, 16),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final BasketController basketController = Get.put(BasketController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: Tdefaultpadding,
                    right: Tdefaultpadding),
                height: 500,
                decoration: const BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Description_Product(
                      det: widget.product,
                    ),
                    const SizedBox(
                      height: Tdefaultpadding,
                    ),
                    Category_Supplier_Products(
                      dete: widget.product,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Favourit_Product(
                      productsModel: widget.product,
                      activeFaDetails: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 45),
                      child: Row(
                        children: [
                          GetBuilder<ProductController>(
                            init: ProductController(),
                            builder: (controller) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    right: Tdefaultpadding),
                                height: 50,
                                width: 58,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkblue),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    priceForCard =
                                        num.parse(widget.product.price);
                                    setState(() {
                                      var elementToCheck = {
                                        'quantity': 1,
                                        'product_id': widget.product.id,
                                      };
                                      bool isContained =
                                          basketItemsPlaceOrderList1.any(
                                        (item) =>
                                            item['quantity'] ==
                                                elementToCheck['quantity'] &&
                                            item['product_id'] ==
                                                elementToCheck['product_id'],
                                      );

                                      if (isContained) {
                                        basketItemsPlaceOrderList1.removeWhere(
                                            (item) =>
                                                item['quantity'] ==
                                                    elementToCheck[
                                                        'quantity'] &&
                                                item['product_id'] ==
                                                    elementToCheck[
                                                        'product_id']);
                                        print('Item is contained, removing...');
                                      } else {
                                        basketItemsPlaceOrderList1
                                            .add(elementToCheck);
                                        print(
                                            'Item is not contained, adding...');
                                      }

                                      var elementToCheck2 = BasketItemModel(
                                        id: widget.product.id,
                                        name: widget.product.name,
                                        price: num.parse(widget.product.price),
                                        image: widget.product.photo,
                                        counter: 1,
                                      );

                                      bool isContained2 =
                                          basketItems.contains(elementToCheck2);
                                      if (isContained2) {
                                        print(
                                            'Item is contained in basketItems, removing...');
                                        basketItems.remove(elementToCheck2);
                                      } else {
                                        print(
                                            'Item is not contained in basketItems, adding...');
                                        basketItems.add(elementToCheck2);
                                      }

                                      isClicked = !isClicked;
                                    });
                                    basketController.up();
                                  },
                                  icon: Center(
                                    child: Icon(
                                      isClicked
                                          ? Icons.shopping_basket
                                          : Icons.shopping_basket_outlined,
                                      color: isClicked ? darkblue : darkblue,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                color: darkblue,
                                onPressed: () {
                                  _handleBuyNow();
                                  myOrdersController.up();
                                }, // Updated here
                                child: Text(
                                  'Buy Now'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: whitecolor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ProductTitleWithImage(
                details: widget.product,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Any additional cleanup if needed
  }
}
