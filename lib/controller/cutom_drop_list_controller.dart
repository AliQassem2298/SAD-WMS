import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustomDropListController extends GetxController {
  RxString selectedOption = ''.obs;

  void setSelectedOption(String newValue) {
    selectedOption.value = newValue;
    update();
  }
}
