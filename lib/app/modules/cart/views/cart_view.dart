import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/common/customList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/app_colors.dart';
import '../../common/custom_cart_item.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text('Order Items', style: AppTextStyles.medium18),
              ),
              CustomCartItem(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    '+ Add more items',
                    style: AppTextStyles.medium18.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Customlist(chargeType: 'Subtotal', amount: '520 Tk'),
              Customlist(chargeType: 'Delivery Fee', amount: '20 Tk'),
              Customlist(chargeType: 'Platform fee', amount: '50 Tk'),
              Customlist(chargeType: 'VAT', amount: '0 Tk'),
              Divider(thickness: 1.r),
              Customlist(chargeType: 'Total', amount: '620 Tk'),
              SizedBox(height: 50.h),
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
