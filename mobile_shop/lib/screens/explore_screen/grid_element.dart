import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/config/const.dart';
import 'package:mobile_shop/controllers/favorite/favorite_controller.dart';
import 'package:mobile_shop/controllers/products/products_controller.dart';
import 'package:mobile_shop/extensions/double_extensions.dart';
import 'package:mobile_shop/routes/route_constant.dart';

import '../../config/app_colors.dart';
import '../../network/models/products_model.dart';

class StarFavorite extends StatelessWidget {
  const StarFavorite({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find<FavoriteController>();
    return GestureDetector(
      onTap: () {
        favoriteController.toggleFavorite(id);
      },
      child: Obx(() => favoriteController.favoriteIds.any((element) => element == id) ? Image.asset(kFullStar) : Image.asset(kEmptyStar),),
    );
  }
}

class GridElement extends StatelessWidget {
  const GridElement({required this.product, super.key});

  final ProductElement product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundProdusColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                GestureDetector(
                  onTap: () {
                    if (product.id != null) {
                      Get.find<ProductsController>().idSelected =
                          product.id!.obs;
                      Get.toNamed(RouteConstant.productScreen, arguments: [
                        product.id!,
                        product.mainImage != null && product.mainImage!.isURL
                            ? product.mainImage!
                            : kUrlImageProdusDefault,
                      ]);
                    }
                  },
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.network(
                      product.mainImage != null && product.mainImage!.isURL
                          ? product.mainImage!
                          : kUrlImageProdusDefault,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: StarFavorite(id: product.id ?? -1),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        product.name != null
            ? Text(
                "${product.name!.length > 26 ? product.name!.replaceRange(22, product.name!.length, '...') : product.name}",
                style: const TextStyle(height: 1.5, fontSize: 16),
                maxLines: 1,
              )
            : const SizedBox(),
        product.details != null
            ? Text(
                "${product.details!.length > 28 ? product.details!.replaceRange(25, product.details!.length, '...') : product.details}",
                style: const TextStyle(
                    height: 1.33, fontSize: 14, color: AppColors.greyTextColor),
                maxLines: 1,
              )
            : const SizedBox(),
        const SizedBox(
          height: 4,
        ),
        Text(
          product.price != null ? "\$${product.price!.showPrice()}" : "",
          style: const TextStyle(
              height: 1.5, fontSize: 16, color: AppColors.greenTextColor),
        ),
      ],
    );
  }
}
