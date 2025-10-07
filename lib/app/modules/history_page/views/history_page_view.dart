import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/history_page_controller.dart';

class HistoryPageView extends GetView<HistoryPageController> {
  const HistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage(ImagePath.product),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.h),
                          child: Text(
                            'Order delivered',
                            style: AppTextStyles.bold15,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivered on',
                                  style: AppTextStyles.regular12,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0.h,
                                  ),
                                  child: Text(
                                    'Order summary',
                                    style: AppTextStyles.regular12,
                                  ),
                                ),
                                Text(
                                  'Total price paid',
                                  style: AppTextStyles.regular12,
                                ),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('26 October', style: AppTextStyles.bold12),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0.h,
                                  ),
                                  child: Text(
                                    'Pudding x 1',
                                    style: AppTextStyles.bold12,
                                  ),
                                ),
                                Text('৳166.98', style: AppTextStyles.bold12),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     // Get.to(ProductDetailsScreen(sold: true,));
                    },
                    child: Text('See Details'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
