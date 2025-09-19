import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

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
                   SizedBox(height: 150.h),
                  Text("Create New Password", style: AppTextStyles.medium32),
                   SizedBox(height: 12.h),
                  Center(
                    child: Text(
                      'Type and confirm a secure new password for your amount',
                      textAlign: TextAlign.center,
                    ),
                  ),
                   SizedBox(height: 30.h),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.isObSecure4.value,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isObSecure4.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: controller.togglePassVisibility,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 20.h),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.isObSecure5.value,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isObSecure5.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: controller.toggleConfirmPassVisibility,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 35.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => LoginView());
                      },
                      child: Text("Confirm"),
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
