import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';

class ProdusSpecification extends StatelessWidget {
  const ProdusSpecification({required this.size, required this.color, super.key});

  final String? size;
  final String? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.borderOptionsColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Size",
                      style: AppTextStyle.normalBlack14,
                    ),
                    Expanded(
                      child: size != null ? Text(
                        size!.length > 12 ? size!.replaceRange(9, size!.length, '...') : size!,
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        style: AppTextStyle.boldBlack14,
                      ) : const SizedBox(),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 23),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.borderOptionsColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Colour",
                      style: AppTextStyle.normalBlack14,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
