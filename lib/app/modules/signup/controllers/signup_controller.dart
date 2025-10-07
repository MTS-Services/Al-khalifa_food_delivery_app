import 'package:al_khalifa/app/api_services/auth_api_services/auth_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../shared_prerf_services/shared_pref_services.dart';

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

  bool signUpInProgress = false;
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController numberTEController = TextEditingController();
  final TextEditingController districtTEController = TextEditingController();
  final TextEditingController cityTEController = TextEditingController();
  final TextEditingController addressTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController =
      TextEditingController();

  Future<void> getSignUP() async {
    signUpInProgress = true;
    update();
    try {
      final response = await AuthApiServices.signUpRequest(
        Urls.registration,
        <String, dynamic>{
          "first_name": firstNameTEController.text.trim(),
          "last_name": lastNameTEController.text.trim(),
          "email": emailTEController.text.trim(),
          "city": cityTEController.text.trim(),
          "district": districtTEController.text.trim(),
          "address": addressTEController.text.trim(),
          "phone_number": numberTEController.text.trim(),
          "role": "customer",
          "password": passwordTEController.text,
        },
      );
      signUpInProgress = false;
      update();
      print(response.body);
      print(response.statusCode.toString());

      if (response.statusCode == 201) {
        await SharedPrefServices.saveUserEmail(emailTEController.text);
        Get.snackbar(' Success', "Registration Successful");
        Get.toNamed(Routes.SIGNUP_OTP);
      } else {
        print(response.body);
        Get.snackbar("Error", '${response.body}');
      }
    } catch (e) {
      signUpInProgress = false;
      update();
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
    }
  }
}
