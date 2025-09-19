import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/otp/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({super.key});

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
              padding:  EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                children: [
                   SizedBox(height: 160.h),
                  Text("Recover Password", style: AppTextStyles.medium32),
                   SizedBox(height: 12.h),
                  Center(
                    child: Text(
                      'Enter the Email Address that you used when\nregister to recover your password, You will receive a\nVerification code.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                   SizedBox(height: 25.h),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter your Email'),
                  ),
                   SizedBox(height: 35.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => OtpView());
                      },
                      child: Text("submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
