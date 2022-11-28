import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../config/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset("assets/icons/search.png"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.searchTextFieldBg,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                cursorColor: AppColors.greenTextColor,
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: AppColors.greenTextColor,
                borderRadius: BorderRadius.circular(45)),
            child: Center(
              child: Image.asset("assets/icons/camera.png"),
            ),
          ),
        ],
      ),
    );
  }
}
