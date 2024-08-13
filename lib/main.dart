import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:warehouse_manegment_system/staff/controller/change_password_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/create_replenishment_request_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/customers_order_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/delivery_page._controller.dart';
import 'package:warehouse_manegment_system/staff/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/product_details_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/replenishment_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/onbordingcontroller.dart';
import 'package:warehouse_manegment_system/staff/controller/orders_for_delivery_page_controller.dart';
// import 'package:warehouse_manegment_system/controller/onbordingcontroller.dart';
import 'package:warehouse_manegment_system/staff/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/put_away_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/shipments_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/drawer_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/splash_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/cycle_count_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/suggested_locations_for_orders_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/suggested_locations_for_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/transfer_page_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/update_user_details_controller.dart';
import 'package:warehouse_manegment_system/staff/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/staff/middleware/auth_middleware.dart';
import 'package:warehouse_manegment_system/staff/middleware/onBoradingMiddleWare.dart';
import 'package:warehouse_manegment_system/staff/middleware/screen_size_middleware.dart';
import 'package:warehouse_manegment_system/staff/view/pages/IntroPages/splash_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/change_password_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/create_replenishment_request_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/customers_order_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/delivery_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/dialog_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/forget_password_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/home_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/home_page_with_drawer.dart';
import 'package:warehouse_manegment_system/staff/view/pages/product_details_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/replenishment_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/on_bording_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/orders_for_delivery_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/orders_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/profile_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/put_away_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/shipments_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/sign_in_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/sign_up_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/cycle_count_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/suggested_locations_for_orders_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/suggested_locations_for_shipment_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/supplier_shipment_page.dart';
// import 'package:warehouse_manegment_system/view/pages/test_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/transfer_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/update_user_details_page.dart';
import 'package:warehouse_manegment_system/staff/view/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_manegment_system/staff/view/pages/drawer_page.dart';

// import 'package:flutter_background_service/flutter_background_service.dart';

SharedPreferences? sharedPreferences;

void main() async {
  // final service = FlutterBackgroundService();
  // Get.put(MyOrdersController());
  // Get.put(Product_Body_Controller());
  // Get.put(FavoriteListController());
  // Get.put(FavoriteController());
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const WeareHouseManegmentSystem());
}

class WeareHouseManegmentSystem extends StatelessWidget {
  const WeareHouseManegmentSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: WelcomePageController.id,
          page: () => const WelcomePage(),
          middlewares: [
            AuthMiddleare(),
          ],
        ),
        GetPage(
          name: SignInPageController.id,
          page: () => const SignInPage(),
        ),
        GetPage(
          name: SignUpPageController.id,
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: UpdateUserDetailsController.id,
          page: () => UpdateUserDetailsPage(),
        ),
        GetPage(
          name: ProductDetailsPageController.id,
          page: () => ProductDetailsPage(),
        ),

        GetPage(
          name: HomePageWithDrawerController.id,
          page: () => HomePageWithDrawer(),
        ),
        GetPage(
          name: DialogPage.id,
          page: () => DialogPage(routeName: WelcomePageController.id),
        ),
        GetPage(
          name: ProfilePageController.id,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: ForgetPasswordPageController.id,
          page: () => const ForgetPasswordPage(),
        ),
        GetPage(
          name: ChangePasswordPageController.id,
          page: () => const ChangePasswordPage(),
        ),
        GetPage(
          name: ShipmentsPageController.id,
          page: () => ShipmentsPage(),
        ),
        GetPage(
          name: PutAwayPageController.id,
          page: () => const PutAwayPage(),
        ),
        GetPage(
          name: OrdersPageController.id,
          page: () => const OrdersPage(),
        ),
        GetPage(
          name: TransferPageController.id,
          page: () => TransferPage(),
        ),
        GetPage(
          name: CycleCountPageController.id,
          page: () => CycleCountPage(),
        ),
        GetPage(
          name: ReplenishmentPageController.id,
          page: () => const ReplenishmentPage(),
        ),
        GetPage(
          name: CreateReplenishmentRequestPageController.id,
          page: () => CreateReplenishmentRequestPage(),
        ),
        GetPage(
          name: SupplierShipmentPagController.id,
          page: () => SupplierShipmentPag(),
        ),
        GetPage(
          name: DrawerPageController.id,
          page: () => const DrawerPage(),
        ),
        GetPage(
          name: HomePageWithDrawerController.id,
          page: () => HomePageWithDrawer(),
        ),
        GetPage(
          name: HomePageController.id,
          page: () => HomePage(),
        ),
        GetPage(
          name: CustomerOrderPageController.id,
          page: () => CustomerOrderPage(),
        ),
        GetPage(
          name: SplachPageController.id,
          page: () => SplashPage(),
          middlewares: [ScreenSizeMiddleware()],
        ),
        GetPage(
          name: DeliveryPageController.id,
          page: () => DeliveryPage(),
        ),
        GetPage(
          name: SuggestedLocationsForShipmentPageController.id,
          page: () => SuggestedLocationsForShipmentPage(),
        ),
        GetPage(
          name: SuggestedLocationsForOrdersPageController.id,
          page: () => SuggestedLocationsForOrdersPage(),
        ),
        GetPage(
          name: OrdersForDeliveryPageController.id,
          page: () => OrdersForDeliveryPage(),
        ),
        // GetPage(
        //   name: Test.id,
        //   page: () => Test(),
        // ),
        GetPage(
          name: OnBordingController.id,
          page: () => OnBordingPage(),
          middlewares: [
            onBoradingMiddleWare(),
          ],
        ),
      ],
      initialRoute: SplachPageController.id,

      // initialRoute: Test.id,

      // initialRoute: WelcomePageController.id,
    );
  }
}
