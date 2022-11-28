import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_shop/controllers/navigation/navigation_controller.dart';

import 'cart_screen/cart_screen.dart';
import 'custom_bottom_navigation_bar.dart';
import 'explore_screen/explore_screen.dart';
import 'user_screen/user_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: Obx( () =>
           PageView(
            onPageChanged: (index) => navigationController.indexPage(index),
            controller: navigationController.pageController.value,
            children: const [
              ExploreScreen(),
              CartScreen(),
              UserScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
