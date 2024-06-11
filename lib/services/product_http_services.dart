import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lesson_35/models/product.dart';

class ProductHttpServices {
  Future<List<Product>> fetchCourse() async {
    final Uri url = Uri.parse(
      "https://products-12640-default-rtdb.firebaseio.com/products.json",
    );
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Product> loadedProduct = [];

    if (data != null) {
      for (var i in data) {
        loadedProduct.add(Product.fromJson(i));
      }
    }
    return loadedProduct;
  }
}
