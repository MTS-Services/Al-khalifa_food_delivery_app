import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/modules/email_verification/views/email_verification_view.dart';
import 'package:al_khalifa/app/modules/signup/views/signup_view.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,//backgroundColor
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: const SizedBox(height: 50)),
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
                    const SizedBox(height: 28),
                    Text('Email or Number', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email or number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('password', style: AppTextStyles.medium16),
                    const SizedBox(height: 8),
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

                    const SizedBox(height: 16),
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
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Log In'),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      'Or Log In with',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.darkBlackColor,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Image.asset(ImagePath.googleIcon, scale: 4),
                    const SizedBox(height: 25),
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
