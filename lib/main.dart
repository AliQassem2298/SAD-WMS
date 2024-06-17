import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_manegment_system/controller/change_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/customers_order_page_controller.dart';
import 'package:warehouse_manegment_system/controller/delivery_page._controller.dart';
import 'package:warehouse_manegment_system/controller/forget_password_page_controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_controller.dart';
import 'package:warehouse_manegment_system/controller/home_page_with_drawer_controller.dart';
import 'package:warehouse_manegment_system/controller/inventory_scan_page_controller.dart';
import 'package:warehouse_manegment_system/controller/onbordingcontroller.dart';
// import 'package:warehouse_manegment_system/controller/onbordingcontroller.dart';
import 'package:warehouse_manegment_system/controller/orders_page_controller.dart';
import 'package:warehouse_manegment_system/controller/profile_page_controller.dart';
import 'package:warehouse_manegment_system/controller/put_away_page_controller.dart';
import 'package:warehouse_manegment_system/controller/shipments_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_in_page_controller.dart';
import 'package:warehouse_manegment_system/controller/sign_up_page_controller.dart';
import 'package:warehouse_manegment_system/controller/drawer_page_controller.dart';
import 'package:warehouse_manegment_system/controller/splash_page_controller.dart';
import 'package:warehouse_manegment_system/controller/stocktaking_page_controller.dart';
import 'package:warehouse_manegment_system/controller/supplier_shipment_page_controller.dart';
import 'package:warehouse_manegment_system/controller/transfer_page_controller.dart';
import 'package:warehouse_manegment_system/controller/update_user_details_controller.dart';
import 'package:warehouse_manegment_system/controller/welcome_page_controller.dart';
import 'package:warehouse_manegment_system/middleware/auth_middleware.dart';
import 'package:warehouse_manegment_system/middleware/onBoradingMiddleWare.dart';
import 'package:warehouse_manegment_system/middleware/screen_size_middleware.dart';
import 'package:warehouse_manegment_system/view/pages/IntroPages/splash_page.dart';
import 'package:warehouse_manegment_system/view/pages/change_password_page.dart';
import 'package:warehouse_manegment_system/view/pages/customers_order_page.dart';
import 'package:warehouse_manegment_system/view/pages/delivery_page.dart';
import 'package:warehouse_manegment_system/view/pages/dialog_page.dart';
import 'package:warehouse_manegment_system/view/pages/forget_password_page.dart';
import 'package:warehouse_manegment_system/view/pages/home_page.dart';
import 'package:warehouse_manegment_system/view/pages/home_page_with_drawer.dart';
import 'package:warehouse_manegment_system/view/pages/inventory_scan_page.dart';
import 'package:warehouse_manegment_system/view/pages/on_bording_page.dart';
import 'package:warehouse_manegment_system/view/pages/orders_page.dart';
import 'package:warehouse_manegment_system/view/pages/profile_page.dart';
import 'package:warehouse_manegment_system/view/pages/put_away_page.dart';
import 'package:warehouse_manegment_system/view/pages/shipments_page.dart';
import 'package:warehouse_manegment_system/view/pages/sign_in_page.dart';
import 'package:warehouse_manegment_system/view/pages/sign_up_page.dart';
import 'package:warehouse_manegment_system/view/pages/stocktaking_page.dart';
import 'package:warehouse_manegment_system/view/pages/supplier_shipment_page.dart';
// import 'package:warehouse_manegment_system/view/pages/test_page.dart';
import 'package:warehouse_manegment_system/view/pages/transfer_page.dart';
import 'package:warehouse_manegment_system/view/pages/update_user_details_page.dart';
import 'package:warehouse_manegment_system/view/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_manegment_system/view/pages/drawer_page.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';

SharedPreferences? sharedPreferences;

void main() async {
  // final service = FlutterBackgroundService();

  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

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
          page: () => const TransferPage(),
        ),
        GetPage(
          name: StocktakingPageController.id,
          page: () => const StocktakingPage(),
        ),
        GetPage(
          name: InventoryScanPageController.id,
          page: () => const InventoryScanPage(),
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
