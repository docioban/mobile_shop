import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_shop/routes/get_pages_constant.dart';
import 'package:mobile_shop/routes/route_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.mainScreen,
      getPages: getPages,
    );
  }
}
