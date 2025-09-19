import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 24.0.h,
                ),
                child: Text('Sign Up', style: AppTextStyles.medium32),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  children: [
                    // First field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('First Name', style: AppTextStyles.medium16),
                           SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter First Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Name', style: AppTextStyles.medium16),
                           SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Last Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(height: 16.h),
                    Text('Email', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your email'),
                    ),
                     SizedBox(height: 16.h),
                    Text('Number', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your number',
                      ),
                    ),
                     SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('District', style: AppTextStyles.medium16),
                           SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter District Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City', style: AppTextStyles.medium16),
                           SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter City Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(height: 16.h),
                    Text('Address', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Example:house no 32',
                      ),
                    ),
                     SizedBox(height: 16.h),
                    Text('Create Password', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    Obx(
                          () => TextFormField(
                        obscureText: controller.isObSecure2.value,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isObSecure2.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,color: AppColors.primaryColor,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),

                     SizedBox(height: 16.h),
                    Text('Confirm Password', style: AppTextStyles.medium16),
                     SizedBox(height: 8.h),
                    Obx(
                          () => TextFormField(
                        obscureText: controller.isObSecure3.value,
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isObSecure3.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,color: AppColors.primaryColor,
                            ),
                            onPressed: controller.toggleConfirmPasswordVisibility,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.isAccepted.value,
                      onChanged: controller.toggleCheckbox,
                    ),
                    Expanded(
                      child:  Text(
                        "I Accept All Terms & Condition",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                     SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Sign Up'),
                      ),
                    ),
                     SizedBox(height: 30.h),
                    Text(
                      'Or Sign UP with',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.darkBlackColor,
                      ),
                    ),
                     SizedBox(height: 30.h),
                    Image.asset(ImagePath.googleIcon, scale: 4),
                     SizedBox(height: 25.h),
                  ],
                ),
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
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Sign In",
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
    );
  }
}
