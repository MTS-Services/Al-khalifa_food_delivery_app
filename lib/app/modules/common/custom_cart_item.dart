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
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.greyLightColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(image: AssetImage(ImagePath.kacchi)),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basmoti Kacchi',
                  style: AppTextStyles.medium14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Obx(
                  () => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.increment();
                        },
                        child: Container(
                          height: 16.r,
                          width: 16.r,
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
                        child: Text("${controller.count.value}"),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.decrement();
                        },
                        child: Container(
                          height: 16.r,
                          width: 16.r,
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
                Text('260 Tk', style: AppTextStyles.medium14),
              ],
            ),
            const Spacer(),
            Icon(Icons.delete_outline_outlined, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
