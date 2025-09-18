import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/reset_password/views/reset_password_view.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 160),
                  Text("Verification", style: AppTextStyles.medium32),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      'We sent Verification code to your Email address',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.RESET_PASSWORD);
                      },
                      child: Text("Next"),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Row(
                children: [
                  Spacer(),
                  Text("Didn't receive a code!", style: AppTextStyles.medium13),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "  Resend",
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 25)),
          SliverToBoxAdapter(
            child: Center(
              child: Text("00.59 sec", style: AppTextStyles.regular14),
            ),
          ),
        ],
      ),
    );
  }
}
