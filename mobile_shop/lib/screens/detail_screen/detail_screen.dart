import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/config/app_text_style.dart';
import 'package:mobile_shop/config/const.dart';
import 'package:mobile_shop/controllers/product/product_controller.dart';
import 'package:mobile_shop/extensions/double_extensions.dart';
import 'package:mobile_shop/extensions/string_extensions.dart';
import 'package:mobile_shop/screens/detail_screen/payment_bar.dart';
import 'package:mobile_shop/screens/detail_screen/produs_specification.dart';
import 'package:mobile_shop/screens/detail_screen/top_sliver_image.dart';

import 'review_container.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    String imageUrl = Get.arguments[1];
    ProductController productController = Get.find<ProductController>();
    
    return Scaffold(
      bottomNavigationBar: Obx(
        () => productController.isLoading == true.obs
            ? const SizedBox()
            : PaymentBar(
                name: productController.product?.name ?? "No name",
                amount: productController.product?.price != null ? productController.product!.price!.showPrice() : "",
              ),
      ),
      body: CustomScrollView(
        slivers: [
          TopSliverImage(id: id, url: imageUrl.validateUrl() ? imageUrl : kUrlImageProdusDefault),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => productController.isLoading == true.obs
                            ? const Text(
                                "Loading...",
                                style: AppTextStyle.boldBlack26,
                              )
                            : Text(
                                productController.product?.name ?? "No name",
                                style: AppTextStyle.boldBlack26,
                              ),
                      ),
                      const SizedBox(height: 28),
                      Obx(
                        () => (productController.isLoading == true.obs)
                            ? const CircularProgressIndicator()
                            : ProdusSpecification(
                                size: productController.product?.size,
                                color: productController.product?.colour,
                              ),
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        "Details",
                        style: AppTextStyle.boldBlack18,
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => (productController.isLoading == true.obs)
                            ? Text(
                                productController.product?.details ??
                                    "Loading...",
                                style: AppTextStyle.normalBlack14,
                              )
                            : Text(
                                productController.product?.details ??
                                    "No details about this product",
                                style: AppTextStyle.normalBlack14,
                              ),
                      ),
                      const SizedBox(height: 44),
                      const Text(
                        "Reviews",
                        style: AppTextStyle.boldBlack18,
                      ),
                      const Text(
                        "Write your",
                        style: AppTextStyle.normalGreen14,
                      ),
                      const SizedBox(height: 16),
                      const ReviewContainer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
