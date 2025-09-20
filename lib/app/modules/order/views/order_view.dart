import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/common/custom_cart_item.dart';
import 'package:al_khalifa/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/location_text.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text('Order Item', style: AppTextStyles.medium18),
                SizedBox(height: 10.h),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CustomCartItem(),
                ),
                SizedBox(height: 20.h),
                Text('Order Details', style: AppTextStyles.medium18),
                SizedBox(height: 10.h),
                CustomRichText(
                  title: 'Order number: ',
                  text: 'Order numbers:kdfsdh',
                ),
                SizedBox(height: 10.h),
                CustomRichText(
                  showIcon: true,
                  text:
                      'Alipur Jame Masjid er opposite side Dhaka City Corporation',
                ),
                SizedBox(height: 10.h),
                Text('Total: TK 546', style: AppTextStyles.medium24),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    'Got Your Order Mr.Kahim',
                    style: AppTextStyles.medium18,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Once the order is confirmed by you, we will start preparing it.',
                  style: AppTextStyles.regular14,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Cancle your order?'),
                          actions: [
                            Column(
                              spacing: 10.h,
                              children: [
                                Text(
                                  'Do you really want the cancle the order?',
                                  style: AppTextStyles.regular14,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Cancle my order',
                                      style: AppTextStyles.regular14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'I\'ll wait for the raider',
                                      style: AppTextStyles.regular14.apply(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    text: 'Cancle',
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    'You can cancle your order within 10 minutes.',
                    style: AppTextStyles.medium12,
                  ),
                ),
                SizedBox(height: 20.h),
                // Timer widget that updates every second
                Obx(
                  () => Center(
                    child: Text(
                      controller.formattedTime,
                      style: AppTextStyles.medium14.copyWith(
                        color: controller.remainingTime.value < 60
                            ? Colors
                                  .red // Change color when less than 1 minute
                            : Colors.black,
                      ),
                    ),
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
