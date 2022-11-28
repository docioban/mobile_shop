import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/config/const.dart';
import 'package:mobile_shop/extensions/string_extensions.dart';

import '../../controllers/product/product_controller.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({super.key});

  static ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => productController.isLoading == true.obs
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productController.product?.reviews?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                if (productController.product?.reviews?[index].message ==
                    null) {
                  return const SizedBox();
                }
                return ReviewUI(
                  imageUrl: productController.product?.reviews?[index].image?.validateUrl() == true ? productController.product!.reviews![index].image! :
                      kUrlProfileImageDefault,
                  firstName:
                      productController.product?.reviews?[index].firstName ??
                          "",
                  lastName:
                      productController.product?.reviews?[index].lastName ?? "",
                  message:
                      productController.product?.reviews?[index].message ?? "",
                  rating:
                      productController.product?.reviews?[index].rating ?? 0,
                );
              },
            ),
    );
  }
}

class ReviewUI extends StatelessWidget {
  const ReviewUI(
      {required this.imageUrl,
      required this.firstName,
      required this.lastName,
      required this.message,
      required this.rating,
      super.key});
  final String imageUrl;
  final String firstName;
  final String lastName;
  final int rating;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(imageUrl.validateUrl() ? imageUrl : kUrlProfileImageDefault),
            foregroundImage: const CachedNetworkImageProvider(
                kUrlProfileImageDefault),
            radius: 23,
          ),
          const SizedBox(width: 32),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "$firstName $lastName",
                    style: const TextStyle(
                        height: 1.29, fontWeight: FontWeight.w700),
                  ),
                  const Expanded(child: SizedBox()),
                  ...List.generate(
                    rating,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(
                        kFullStar,
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                message,
                style: const TextStyle(height: 1.14),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
