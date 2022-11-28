import 'package:flutter/material.dart';
import 'package:mobile_shop/config/app_text_style.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Empty page",
        style: AppTextStyle.normalGrey12,
      ),
    );
  }
}
