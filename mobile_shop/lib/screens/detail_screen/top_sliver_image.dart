import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/config/const.dart';

import '../../config/app_colors.dart';
import '../../controllers/favorite/favorite_controller.dart';

class _FavoriteStar extends StatelessWidget {
  const _FavoriteStar({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find<FavoriteController>();

    return GestureDetector(
      onTap: () {
        favoriteController.toggleFavorite(id);
      },
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Obx(
          () => favoriteController.favoriteIds.any((element) => element == id)
              ? Image.asset(
                  kFullStar,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  kEmptyStar,
                  fit: BoxFit.contain,
                ),
        ),
      ),
    );
  }
}

class TopSliverImage extends StatelessWidget {
  const TopSliverImage({required this.id, required this.url, super.key});

  final int id;
  final String url;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      expandedHeight: 480,
      collapsedHeight: 196,
      automaticallyImplyLeading: false,
      shadowColor: Colors.transparent,
      flexibleSpace: Stack(
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: AppColors.backgroundProdusColor,
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Hero(
                  tag: id,
                  child: CachedNetworkImage(imageUrl:
                    url,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 16.0, top: 88.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset("assets/icons/vector.png"),
                  ),
                ),
                _FavoriteStar(id: id,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
