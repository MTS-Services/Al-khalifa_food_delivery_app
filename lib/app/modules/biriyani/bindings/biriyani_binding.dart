import 'package:get/get.dart';

import '../controllers/biriyani_controller.dart';

class BiriyaniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiriyaniController>(
      () => BiriyaniController(),
    );
  }
}
