import 'package:get/get.dart';
import 'package:task_app/source_code/Models/products.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(ProductsModel product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    if (product != 0) {
      print(_products.length);
      print("this product is added ${product.title}");
      // Get.snackbar(
      //     "Product added to cart", "Your item ${product.title} has been added",
      //     snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
    }
    if (product == 0) {
      print("not added");

      Get.snackbar("Cart error", "Your item could not be added",
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
    }
  }

  void removeProduct(ProductsModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubTotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
