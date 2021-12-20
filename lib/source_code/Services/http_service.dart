import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_app/source_code/Models/products.dart';

class HttpService {
  static Future<List<ProductsModel>> fetchProducts(count) async {
    var response = await http
        .get(Uri.parse("https://fakestoreapi.com/products?limit=$count"));
    if (response.statusCode == 200) {
      var data = response.body;
      // final jsonData = jsonDecode(response.body[0]) as List;

      return productsModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
