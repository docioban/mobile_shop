import 'package:get/get_connect.dart';

class ProductsRequest extends GetConnect {
  Future<Response> getProducts(int page, int pageSize) async {
    return get("http://mobile-shop-api.hiring.devebs.net/products?page=$page&page_size=$pageSize");
  }

  Future<Response> getBestSoldProducts(int page, int pageSize) async {
    return get(
        "http://mobile-shop-api.hiring.devebs.net/products/best-sold-products?page=$page&page_size=$pageSize");
  }
}