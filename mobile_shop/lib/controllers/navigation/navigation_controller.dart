import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class NavigationController extends GetxController {
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt indexPage = 0.obs;

  animateToPage(int page) {
    indexPage(page);
    pageController.value.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
