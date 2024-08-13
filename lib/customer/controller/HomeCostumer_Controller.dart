// ignore_for_file: file_names
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 2.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
