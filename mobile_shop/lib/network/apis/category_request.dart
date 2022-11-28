import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile_shop/network/models/category_model.dart';

class CategoryProvider extends GetConnect {
  Future<Response> getCaterories() async {
    return get("http://mobile-shop-api.hiring.devebs.net/categories");
  }
}
