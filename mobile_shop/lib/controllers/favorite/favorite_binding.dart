import 'package:get/get.dart';
import 'package:mobile_shop/controllers/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
