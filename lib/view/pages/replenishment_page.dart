import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/constans.dart';
import 'package:warehouse_manegment_system/controller/create_replenishment_request_page_controller.dart';
import 'package:warehouse_manegment_system/controller/replenishment_page_controller.dart';
import 'package:warehouse_manegment_system/model/models/list_replenishment_requests_MODEL.dart';
import 'package:warehouse_manegment_system/model/services/list_replenishment_requests_service.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_button.dart';
import 'package:warehouse_manegment_system/view/widgets/custom_replenshment_request_card.dart';

class ReplenishmentPage extends StatelessWidget {
  const ReplenishmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReplenishmentPageController>(
      init: ReplenishmentPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    kFirstColor,
                    kFirstColor2,
                  ],
                ),
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: kSecondtColor,
            title: Text(
              'Replenishment request Page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  kFirstColor,
                  kFirstColor2,
                ],
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 2.h,
                  ),
                  child: FutureBuilder<List<ListReplenishmentRequestsModel>>(
                    future: ListReplenishmentRequestsService()
                        .listReplenishmentRequests(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: TextStyle(
                              fontSize: 6.w,
                            ),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              'No Requests found',
                              style: TextStyle(
                                fontSize: 6.w,
                                color: kWhiteColor,
                              ),
                            ),
                          );
                        } else {
                          controller.requests = snapshot.data!;
                          return ListView.builder(
                            itemCount: controller.requests!.length,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              return CustomReplenshmentRequestCard(
                                listAllOrdersModel: controller.requests![index],
                              ).paddingSymmetric(vertical: 1.h);
                            },
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ).paddingOnly(bottom: 10.h),
                ),
                Positioned(
                  bottom: 0.h,
                  child: Container(
                    height: 13.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          kFirstColor,
                          kFirstColor2,
                        ],
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                    child: CustomButton(
                      hasBorder: true,
                      onPressed: () async {
                        try {
                          Get.toNamed(
                            CreateReplenishmentRequestPageController.id,
                          );
                        } catch (e) {
                          print(e.toString());
                          Get.snackbar(
                            'Error',
                            e.toString(),
                            colorText: Colors.white,
                          );
                        }
                      },
                      text: 'Create Replenishment Request',
                      fontSize: 5.w,
                      textColor: kFirstColor,
                      gradient: const LinearGradient(
                        colors: [
                          kWhiteColor,
                          kWhiteColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
