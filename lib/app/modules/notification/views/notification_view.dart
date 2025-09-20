import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/widgets/notification_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: AppTextStyles.regular18.apply(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: AppTextStyles.regular18.apply(
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Text(
                  'Mark all as read',
                  style: AppTextStyles.regular14.apply(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.builder(
                itemCount: 45,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: NotificationContainer(
                    iconImage: ImagePath.carIcon,
                    time: '1h',
                    notiTitle: 'Order Shipped',
                    notiSubTitle:
                        'Lorem ipsum dolor sit amet,consectrtur adipiscing elit, sed do ejusmod tempor incididunt ut labore et dolore magne al',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
