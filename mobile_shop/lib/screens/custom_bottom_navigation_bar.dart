import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_shop/controllers/navigation/navigation_controller.dart';

import '../config/app_colors.dart';

class NamePageWorld extends StatelessWidget {
  const NamePageWorld({required this.name, super.key});

  final String name;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name),
        const Icon(
          Icons.circle,
          size: 6,
        ),
      ],
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  static final NavigationController navigationController =
      Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84 + MediaQuery.of(context).padding.bottom,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadowColor,
            offset: Offset(0, -1),
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    navigationController.animateToPage(0);
                  },
                  child: Obx(() => navigationController.indexPage == 0.obs
                      ? const NamePageWorld(name: "Explorer")
                      : Center(
                          child: Image.asset(
                          "assets/icons/bulb.png",
                          height: 43,
                          width: 43,
                        )))),
            ),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      navigationController.animateToPage(1);
                    },
                    child: Obx(() => navigationController.indexPage == 1
                        ? const NamePageWorld(name: "Cart")
                        : Image.asset("assets/icons/cart.png")))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      navigationController.animateToPage(2);
                    },
                    child: Obx(() => navigationController.indexPage == 2
                        ? const NamePageWorld(name: "User")
                        : Image.asset("assets/icons/user.png")))),
          ],
        ),
      ),
    );
  }
}
