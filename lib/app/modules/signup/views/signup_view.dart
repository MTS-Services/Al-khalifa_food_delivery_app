import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Text('Sign Up', style: AppTextStyles.medium32),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // First field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('First Name', style: AppTextStyles.medium16),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter First Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Name', style: AppTextStyles.medium16),
                          const SizedBox(height: 8),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text('Email', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your email'),
                    ),
                    const SizedBox(height: 16),
                    Text('Number', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your number',
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // First field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('District', style: AppTextStyles.medium16),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter District Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City', style: AppTextStyles.medium16),
                          const SizedBox(height: 8),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text('Address', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Example:house no 32',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Create Password', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
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

                    const SizedBox(height: 16),
                    Text('Confirm Password', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
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
                      child: const Text(
                        "I Accept All Terms & Condition",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 30),
                    Text(
                      'Or Sign UP with',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.darkBlackColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Image.asset(ImagePath.googleIcon, scale: 4),
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
