import 'package:get/route_manager.dart';
import 'package:mobile_shop/controllers/category/category_binding.dart';
import 'package:mobile_shop/controllers/favorite/favorite_binding.dart';
import 'package:mobile_shop/controllers/navigation/navigation_binding.dart';
import 'package:mobile_shop/controllers/products/products_binding.dart';
import 'package:mobile_shop/screens/detail_screen/detail_screen.dart';
import 'package:mobile_shop/screens/explore_screen/explore_screen.dart';
import 'package:mobile_shop/screens/main_screen.dart';

import '../controllers/product/product_binding.dart';
import 'route_constant.dart';

List<GetPage> getPages = [
  GetPage(
    name: RouteConstant.mainScreen,
    page: () => const MainScreen(),
    bindings: [
      NavigationBinding(),
      FavoriteBinding(),
      CategoryBinding(),
      ProductsBinding(),
    ],
  ),
  GetPage(
    name: RouteConstant.productScreen,
    page: () => const DetailedScreen(),
    binding: ProductBinding(),
  ),
];
