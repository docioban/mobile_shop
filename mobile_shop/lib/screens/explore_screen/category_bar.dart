import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mobile_shop/config/app_text_style.dart';

import '../../config/app_colors.dart';
import '../../controllers/category/category_controller.dart';

class CategoryElement extends StatelessWidget {
  const CategoryElement({required this.name, required this.url, super.key});

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.boxShadowColor,
                      blurRadius: 20,
                      offset: Offset(0, 6))
                ],
              ),
              child: CachedNetworkImage(imageUrl: url),
            ),
            const SizedBox(height: 14),
            AutoSizeText(
              name,
              style: AppTextStyle.normalBlack12.copyWith(),
              minFontSize: 8,
              maxFontSize: 12,
              maxLines: 2,
              wrapWords: false,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  static CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: Obx(
        () => (categoryController.isLoading == true.obs
            ? const Center(child: const CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.only(left: 7),
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.category?.count ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  if (categoryController.category?.results?[index].name ==
                          null ||
                      categoryController.category?.results?[index].icon ==
                          null) {
                    return const CircularProgressIndicator();
                  } else {
                    return CategoryElement(
                        name:
                            categoryController.category!.results![index].name!,
                        url:
                            categoryController.category!.results![index].icon!);
                  }
                },
              )),
      ),
    );
  }
}
