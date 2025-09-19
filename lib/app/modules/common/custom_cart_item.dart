import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/app_colors.dart';
import '../../data/app_text_styles.dart';
import '../../data/image_path.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.greyLightColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 90.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(ImagePath.kacchi),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basmoti Kacchi',
                    style: AppTextStyles.medium14,
                  ),
                  Text('1'),
                  Text('260 Tk', style: AppTextStyles.medium14),
                ],
              ),
            ),
            Spacer(),
            Icon(Icons.delete_outline_outlined, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
