import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/network/apis/category_request.dart';
import 'package:mobile_shop/network/models/category_model.dart';
import 'package:mobile_shop/network/network_check.dart';

class CategoryController extends GetxController {
  CategoryModel? category;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  getCategories() async {
    try {
      isLoading(true);
      Response response = await CategoryProvider().getCaterories();
      if (response.statusCode == 200) {
        category =
            CategoryModel.fromJson(json.decode(json.encode(response.body)));
      } else {
        NetworkCheck().checkNetwork(function: () => getCategories());
      }
    } catch (e) {
      print('Error is: $e');
    } finally {
      isLoading(false);
    }
  }
}
