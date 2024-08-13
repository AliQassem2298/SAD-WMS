// ignore_for_file: file_names

import 'package:get/get.dart';

import '../Models/Search/SearchModel.dart';
import '../Services/SearchService.dart';

class SearchController extends GetxController {
  var query = ''.obs;
  var products = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(query, (_) => searchProducts(query.value),
        time: const Duration(milliseconds: 500));
  }

  void searchProducts(String query) async {
    if (query.isEmpty) {
      products.clear();
      return;
    }
    isLoading.value = true;
    try {
      SearchModel result = await SearchService().getsearch(query);
      products.value = result.products;
    } catch (error) {
      Get.snackbar('Error', 'An error occurred while searching');
    } finally {
      isLoading.value = false;
    }
  }

  void updateQuery(String newQuery) {
    query.value = newQuery;
  }
}
