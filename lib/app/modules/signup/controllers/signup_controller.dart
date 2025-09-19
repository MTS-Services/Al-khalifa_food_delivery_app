import 'package:get/get.dart';

class SignupController extends GetxController {

  var isAccepted = false.obs;

  void toggleCheckbox(bool? value) {
    isAccepted.value = value ?? false;
  }
  var isObSecure2 = true.obs;

  void togglePasswordVisibility() {
    isObSecure2.value = !isObSecure2.value;
  }


  var isObSecure3 = true.obs;

  void toggleConfirmPasswordVisibility() {
    isObSecure3.value = !isObSecure3.value;
  }

}
