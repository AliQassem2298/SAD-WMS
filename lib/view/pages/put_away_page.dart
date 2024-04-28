import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';

class PutAwayPage extends StatelessWidget {
  const PutAwayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PutAwayPageController>(
      init: PutAwayPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Put Away Page'),
          ),
        );
      },
    );
  }
}
