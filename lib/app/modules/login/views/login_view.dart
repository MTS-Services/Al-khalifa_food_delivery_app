import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/modules/email_verification/views/email_verification_view.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor, //backgroundColor
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child:SizedBox(height: 50.h)),
              SliverToBoxAdapter(
                child: Text(
                  'Log In \nYour Account',
                  style: AppTextStyles.medium32,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(height: 28.h),
                    Text('Email or Number', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email or number',
                      ),
                    ),
                     SizedBox(height: 16.h),
                    Text('password', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    Obx(
                      () => TextFormField(
                        obscureText: controller.isObSecure1.value,
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isObSecure1.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),

                     SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => EmailVerificationView());
                        },
                        child: Text(
                          'Forgetted Password',
                          style: AppTextStyles.medium16.copyWith(
                            color: Color(0xffFF5900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                     SizedBox(height: 40.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.CUSTOM_BOTTOOM_BAR);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Log In'),
                      ),
                    ),
                     SizedBox(height: 35.h),
                    Text(
                      'Or Log In with',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.darkBlackColor,
                      ),
                    ),
                     SizedBox(height: 35.h),
                    Image.asset(ImagePath.googleIcon, scale: 4),
                     SizedBox(height: 25.h),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Don't have an account? ",
                        style: AppTextStyles.medium13,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          "Sign Up",
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
            ],
          ),
        ),
      ),
    );
  }
}
