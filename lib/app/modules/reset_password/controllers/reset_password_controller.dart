import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  //TODO: Implement ResetPasswordController
  var isObSecure4 = true.obs;

  void togglePassVisibility() {
    isObSecure4.value = !isObSecure4.value;
  }


  var isObSecure5 = true.obs;

  void toggleConfirmPassVisibility() {
    isObSecure5.value = !isObSecure5.value;
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
