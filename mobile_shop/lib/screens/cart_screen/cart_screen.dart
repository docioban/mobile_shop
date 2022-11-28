import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_shop/controllers/favorite/favorite_controller.dart';
import 'package:mobile_shop/controllers/products/products_controller.dart';
import 'package:mobile_shop/network/models/products_model.dart';
import 'package:mobile_shop/screens/explore_screen/explore_screen.dart';

import '../explore_screen/grid_element.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static final FavoriteController favoriteController =
      Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(
        () => (favoriteController.isLoading == true.obs)
            ? const CircularProgressIndicator()
            : GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: favoriteController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 28.0,
                  childAspectRatio: (164 / 316),
                ),
                itemBuilder: (BuildContext context, int index) {
                  // return SizedBox();
                  return GridElement(
                    product:
                        favoriteController.productList[index] as ProductElement,
                  );
                },
              ),
      ),
    );
  }
}
