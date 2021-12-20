import 'package:get/get.dart';
import 'package:task_app/source_code/Services/http_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  bool refreshed = false;

  @override
  void onInit() {
    fetchProducts(2);
    super.onInit();
  }

  void fetchProducts(count) async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts(count);
      if (products != 0) {
        productList.value = products;

        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
