import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.iconImage,
    required this.notiTitle,
    required this.notiSubTitle,
    required this.time,
  });
  final String iconImage;
  final String notiTitle;
  final String notiSubTitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.notiContainerColor,
            radius: 30.r,
            child: Image.network(iconImage, height: 32.h, width: 40.w),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.notiContainerColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(notiTitle, style: AppTextStyles.medium16),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_outlined,color: Colors.red.shade400,)),
                    ],
                  ),
                  Text(notiSubTitle, style: AppTextStyles.regular12),
                  const SizedBox(height: 5,),
                  Text(time, style: AppTextStyles.regular14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
