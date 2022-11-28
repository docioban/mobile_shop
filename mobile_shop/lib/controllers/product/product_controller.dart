import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile_shop/network/models/product_model.dart';

import '../../network/apis/product_request.dart';
import '../../network/network_check.dart';
import '../products/products_controller.dart';

class ProductController extends GetxController {
  ProductModel? product;
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    ProductsController productsController = Get.find<ProductsController>();
    if (productsController.idSelected != null) {
      getProduct(productsController.idSelected!.toInt());
    }
  }

  getProduct(int id) async {
    try {
      isLoading(true);
      Response response = await ProductRequest().getProducts(id);
      if (response.statusCode == 200) {
        product =
            ProductModel.fromJson(json.decode(json.encode(response.body)));
      } else {
        NetworkCheck().checkNetwork(function:() => getProduct(id));
      }
    } catch (e) {
      print('Error is: $e');
    } finally {
      isLoading(false);
    }
  }
}
