import 'package:get/instance_manager.dart';
import 'package:mobile_shop/controllers/products/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(() => ProductsController());
  }
}