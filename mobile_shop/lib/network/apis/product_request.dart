import 'package:get/get_connect.dart';

class ProductRequest extends GetConnect {
  Future<Response> getProducts(int id) async {
    return get(
        "http://mobile-shop-api.hiring.devebs.net/products/$id");
  }
}