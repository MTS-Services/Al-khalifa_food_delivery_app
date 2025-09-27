import 'package:al_khalifa/app/modules/cart/controllers/cart_controller.dart';
import 'package:al_khalifa/app/modules/home/controllers/home_controller.dart';
import 'package:al_khalifa/app/modules/order/controllers/order_controller.dart';
import 'package:al_khalifa/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/custom_bottoom_bar_controller.dart';

class CustomBottoomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomBottoomBarController>(
      () => CustomBottoomBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<OrderController>(
      () => OrderController(),
    );
    Get.put(ProfileController());
  }
}
