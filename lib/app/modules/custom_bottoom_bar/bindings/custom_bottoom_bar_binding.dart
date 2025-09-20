import 'package:get/get.dart';

import '../controllers/custom_bottoom_bar_controller.dart';

class CustomBottoomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomBottoomBarController>(
      () => CustomBottoomBarController(),
    );
  }
}
