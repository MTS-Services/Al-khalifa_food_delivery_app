import 'package:get/get.dart';

import '../controllers/curent_location_controller.dart';

class CurentLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurentLocationController>(
      () => CurentLocationController(),
    );
  }
}
