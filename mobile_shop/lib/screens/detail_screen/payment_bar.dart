import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';

class PaymentBar extends StatelessWidget {
  const PaymentBar({required this.name, required this.amount, super.key});

  final String name;
  final String amount;

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
        padding: EdgeInsets.only(
            right: 30,
            left: 30,
            top: 16,
            bottom: MediaQuery.of(context).padding.bottom),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.normalGrey12,
                  ),
                  Text(
                    amount,
                    style: AppTextStyle.normalGreen18,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: AppColors.greenTextColor,
                  borderRadius: BorderRadius.circular(4)),
              child: const Center(
                  child: Text(
                "ADD",
                style: TextStyle(height: 1.43, color: Colors.white),
              )),
            )),
          ],
        ),
      ),
    );
  }
}
