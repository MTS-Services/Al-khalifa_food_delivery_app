import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/modules/common/customList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Order Items', style: AppTextStyles.medium18),
              ),
              CustomCartItem(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    '+ Add more items',
                    style: AppTextStyles.medium18.copyWith(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Customlist(chargeType: 'Subtotal', amount: '520 Tk'),
              Customlist(chargeType: 'Delivery Fee', amount: '20 Tk'),
              Customlist(chargeType: 'Platform fee', amount: '50 Tk'),
              Customlist(chargeType: 'VAT', amount: '0 Tk'),
              Divider(),
              Customlist(chargeType: 'Total', amount: '620 Tk'),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Review Payment and address',
                    style: AppTextStyles.medium18,
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
