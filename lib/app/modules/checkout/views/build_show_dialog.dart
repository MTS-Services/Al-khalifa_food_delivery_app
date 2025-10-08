import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';
import '../../../routes/app_pages.dart';

Future<dynamic> buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline_outlined,
            color: AppColors.primaryColor,
            size: 32.sp,
          ),
          SizedBox(height: 12.h),
          Text(
            'Your Order',
            style: AppTextStyles.medium18,
            textAlign: TextAlign.center,
          ),
          Text(
            'Has been Successful',
            style: AppTextStyles.regular14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Divider(),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.CUSTOM_BOTTOOM_BAR);
            },
            child: Text(
              'Go to Home',
              style: AppTextStyles.medium14.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      alignment: Alignment.center,
    ),
  );
}
