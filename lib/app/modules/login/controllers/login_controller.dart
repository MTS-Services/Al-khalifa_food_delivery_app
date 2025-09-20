import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController



  var isObSecure1 = true.obs;

  void togglePasswordVisibility() {
    isObSecure1.value = !isObSecure1.value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
