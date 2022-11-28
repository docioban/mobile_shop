import 'package:get/instance_manager.dart';
import 'package:mobile_shop/controllers/navigation/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
