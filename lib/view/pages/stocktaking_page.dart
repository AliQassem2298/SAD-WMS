import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/stocktaking_page_controller.dart';

class StocktakingPage extends StatelessWidget {
  const StocktakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StocktakingPageController>(
      init: StocktakingPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Stocktaking Page'),
          ),
        );
      },
    );
  }
}
