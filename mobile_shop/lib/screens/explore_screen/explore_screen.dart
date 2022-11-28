import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/config/app_text_style.dart';
import 'package:mobile_shop/controllers/favorite/favorite_controller.dart';
import 'package:mobile_shop/controllers/products/products_controller.dart';
import 'package:mobile_shop/screens/cart_screen/cart_screen.dart';
import 'package:mobile_shop/screens/custom_bottom_navigation_bar.dart';
import 'package:mobile_shop/screens/explore_screen/category_bar.dart';
import 'package:mobile_shop/screens/explore_screen/search_bar.dart';
import 'package:mobile_shop/screens/user_screen/user_page.dart';

import 'grid_element.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static final ScrollController _scrollController = ScrollController();
  static ProductsController productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 500 &&
            !_scrollController.position.outOfRange) {
          productsController.getProducts();
        }
      },
    );

    return ListView(
      controller: _scrollController,
      children: [
        const SearchBar(),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 44.0, bottom: 18),
          child: Text(
            "Categories",
            style: AppTextStyle.boldBlack18,
          ),
        ),
        const CategoryBar(),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
          child: SizedBox(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Best selling",
                  style: AppTextStyle.boldBlack18,
                ),
                Text(
                  "See all",
                  style: AppTextStyle.normalBlack16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: BestSoldProductsGrid(),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 16, left: 16, top: 44),
          child: SizedBox(
            height: 24,
            child: Text(
              "More to explore",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.33,
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: AllProductsGrid(),
        ),
      ],
    );
  }
}

class BestSoldProductsGrid extends StatelessWidget {
  const BestSoldProductsGrid({super.key});

  static ProductsController productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => (GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: productsController.bestSoldProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 28.0,
            childAspectRatio: (164 / 316),
          ),
          itemBuilder: (BuildContext context, int index) {
            return GridElement(
              product: productsController.bestSoldProducts[index],
            );
          },
        )));
  }
}

class AllProductsGrid extends StatelessWidget {
  const AllProductsGrid({super.key});

  static ProductsController productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => 
          GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: productsController.productElements.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 28.0,
                childAspectRatio: (164 / 316),
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridElement(
                  product: productsController.productElements[index],
                );
              },
            ),
    );
  }
}
