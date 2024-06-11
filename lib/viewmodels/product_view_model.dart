import 'package:lesson_35/models/product.dart';
import 'package:lesson_35/services/product_http_services.dart';

class ProductViewModel {
  final productHttpServices = ProductHttpServices();

  Future<List<Product>> getProduct() async {
    List<Product> products = await productHttpServices.fetchCourse();
    return products;
  }
}
