import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile_shop/controllers/favorite/favorite_controller.dart';
import 'package:mobile_shop/network/apis/products_request.dart';
import 'package:mobile_shop/network/models/products_model.dart';

import '../../network/network_check.dart';

class ProductsController extends GetxController {
  RxList bestSoldProducts = [].obs;
  RxBool isLoadingBestSoldProducts = false.obs;
  RxList productElements = [].obs;
  RxBool isLoadingProducts = false.obs;
  RxInt? idSelected;
  int page = 0;
  int pageSize = 10;

  @override
  void onInit() {
    super.onInit();
    getBestSoldProducts(1, 2);
    getProducts();
  }

  getProducts() async {
    if (isLoadingProducts == false.obs) {
      try {
        isLoadingProducts(true);
        Response response =
            await ProductsRequest().getProducts(page + 1, pageSize);
        if (response.statusCode == 200) {
          ProductsModel? products =
              ProductsModel.fromJson(json.decode(json.encode(response.body)));
          if (products.results != null) {
            productElements.addAll(products.results!.toList());
            page++;
          }
        } else {
          NetworkCheck().checkNetwork(function: () => getProducts());
        }
      } catch (e) {
        print('Error is: $e');
      } finally {
        isLoadingProducts(false);
      }
      Get.find<FavoriteController>().getElements();
    }
  }

  getBestSoldProducts(int page, int pageSize) async {
    try {
      isLoadingBestSoldProducts(true);
      Response response =
          await ProductsRequest().getBestSoldProducts(page, pageSize);
      if (response.statusCode == 200) {
        ProductsModel? products =
            ProductsModel.fromJson(json.decode(json.encode(response.body)));
        if (products.results != null) {
          bestSoldProducts.addAll(products.results!.toList());
        }
      } else {
        NetworkCheck().checkNetwork(function: () => getBestSoldProducts(1, 2));
      }
    } catch (e) {
      print('Error is: $e');
    } finally {
      isLoadingBestSoldProducts(false);
    }
  }
}
