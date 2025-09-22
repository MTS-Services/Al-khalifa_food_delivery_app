import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../data/app_colors.dart';
import '../../data/app_text_styles.dart';
import '../../data/image_path.dart';
import '../checkout/controllers/checkout_controller.dart';

class CustomCartItem extends StatelessWidget {
  CustomCartItem({super.key});

  final controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.greyLightColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: AssetImage(ImagePath.kacchi),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basmoti Kacchi',
                      style: AppTextStyles.medium14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.h),
                    Obx(
                          () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: controller.increment,
                            child: Container(
                              height: 18.r,
                              width: 18.r,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Text('+', style: AppTextStyles.regular10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text("${controller.count.value}",
                                style: AppTextStyles.medium14),
                          ),
                          GestureDetector(
                            onTap: controller.decrement,
                            child: Container(
                              height: 18.r,
                              width: 18.r,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Text('-', style: AppTextStyles.regular10),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 6.h),
                    Text('260 Tk', style: AppTextStyles.medium14),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                children: [
                  SizedBox(height: 50.h,),
                  Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.primaryColor,
                    size: 24.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
