import 'dart:async';

import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:al_khalifa/app/shared_prerf_services/shared_pref_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_services/auth_api_services/auth_api_services.dart';
import '../../../api_services/utility/urls.dart';

class OtpController extends GetxController {
  bool otpInProgress = false;
  final TextEditingController otpController = TextEditingController();

  Future<void> getOtpVerification() async {
      otpInProgress = true;
      update();
    final email = await SharedPrefServices.getUserEmail();
    try {
      final response = await AuthApiServices.signUpOtpRequest(
        Urls.otpSignUp,
        <String, dynamic>{
          "email": email,
          "otp": otpController.text.trim()},
      );
      otpInProgress = false;
      update();
      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
       await SharedPrefServices.saveUserOtp(otpController.text);
        Get.snackbar('Success', "Otp Verification Successful",backgroundColor:Colors.green.shade100);
        Get.toNamed(Routes.RESET_PASSWORD);
      } else {
        Get.snackbar("Error", '${response.body}',backgroundColor:Colors.red.shade400);
      }
    } catch (e) {
      otpInProgress = false;
      update();
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
    }
  }


  int remainingSeconds = 0;
  Timer? _timer;
  bool canResend = true;


  void startTimer() {
    canResend = false;
    remainingSeconds = 59;
    update();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        canResend = true;
        timer.cancel();
      } else {
        remainingSeconds--;
      }
      update();
    });
  }

  Future<void> resendOtp() async {
    if (!canResend) return;
    try {
      final savedEmail = await SharedPrefServices.getUserEmail();
      final response = await AuthApiServices.emailVerifyRequest(
        Urls.emailVerify,
        {"email": savedEmail},
      );
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'OTP resent successfully',backgroundColor: Colors.green.shade100);
        startTimer();
      } else {
        Get.snackbar('Failed', '${response.body}',backgroundColor: Colors.red.shade400);
      }
    } catch (e) {
      Get.snackbar('Error', 'Resend failed: ${e.toString()}');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
