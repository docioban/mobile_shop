import 'package:get/get.dart';
import 'package:mobile_shop/utils/favorite_storage.dart';

import '../../network/models/products_model.dart';
import '../products/products_controller.dart';

class FavoriteController extends GetxController {
  RxList<int> favoriteIds = RxList();
  RxBool isLoading = true.obs;
  RxList<dynamic> productList = [].obs;

  @override
  void onInit() {
    super.onInit();
    asyncInit();
  }

  asyncInit() async {
    favoriteIds = (await FavoriteStorage().getFavorites()).obs;
  }

  getElements() {
    for (int favoriteId in favoriteIds) {
      searchNewProduct(favoriteId);
    }
    isLoading(false);
  }

  toggleFavorite(int id) {
    if (exist(id)) {
      removeFavorite(id);
    } else {
      addFavorite(id);
    }
  }

  bool exist(int id) {
    return favoriteIds.any((element) => element == id);
  }

  searchNewProduct(int id) {
    ProductsController productsController = Get.find<ProductsController>();
    ProductElement? productModel = productsController.productElements
        .firstWhereOrNull((element) => element.id == id);
    if (productModel != null) {
      productList.add(productModel);
    } else {
      productModel = productsController.bestSoldProducts
          .firstWhereOrNull((element) => element.id == id);
      if (productModel != null) {
        productList.add(productModel);
      }
    }
  }

  addFavorite(int id) {
    if (!exist(id)) {
      favoriteIds.add(id);
      searchNewProduct(id);
      FavoriteStorage().setFavorites(favoriteIds);
    }
  }

  removeFavorite(int id) {
    favoriteIds.remove(id);
    productList
        .removeWhere((dynamic item) => (item as ProductElement).id == id);
    FavoriteStorage().setFavorites(favoriteIds);
  }
}
