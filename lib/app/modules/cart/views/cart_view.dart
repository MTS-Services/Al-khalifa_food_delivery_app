/*
import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/common/custom_list.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common/custom_cart_item.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: GetBuilder<CartController>(
              builder: (cartController) {
                if(cartController.cartInProgress){
                  return Center(child: CircularProgressIndicator(),);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text('Order Items', style: AppTextStyles.medium18),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cartController.cartItemModelData.length,
                      itemBuilder: (context, index){
                        print(cartController.cartItemModelData.length);
                        print("called");
                        return CustomCartItem(cartItemModel: cartController.cartItemModelData[index],);
                      }
                    ),
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
                    CustomList(chargeType: 'Subtotal', amount: '520 Tk'),
                    CustomList(chargeType: 'Delivery Fee', amount: '20 Tk'),
                    CustomList(chargeType: 'Platform fee', amount: '50 Tk'),
                    CustomList(chargeType: 'VAT', amount: '0 Tk'),
                    Divider(thickness: 1.r),
                    CustomList(chargeType: 'Total', amount: '620 Tk'),
                    SizedBox(height: 50.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.CHECKOUT);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Text(
                            'Review Payment and address',
                            style: AppTextStyles.medium18,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
*/

import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/common/custom_list.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/custom_cart_item.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: GetBuilder<CartController>(
              builder: (cartController) {
                if (cartController.cartInProgress) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text('Order Items', style: AppTextStyles.medium18),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.cartItemModelData.length,
                      itemBuilder: (context, index) {
                        return CustomCartItem(
                          cartItemModel:
                          cartController.cartItemModelData[index],
                        );
                      },
                    ),

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

                    GetBuilder<CartController>(
                      id: 'totals',
                      builder: (c) => Column(
                        children: [
                          CustomList(
                            chargeType: 'Subtotal',
                            amount: c.money(c.subtotal),
                          ),
                          CustomList(
                            chargeType: 'Delivery Fee',
                            amount: c.money(c.deliveryFee),
                          ),
                          CustomList(
                            chargeType: 'Platform fee',
                            amount: c.money(c.platformFee),
                          ),
                          CustomList(
                            chargeType: 'VAT',
                            amount: c.money(c.vatAmount),
                          ),
                          Divider(thickness: 1.r),
                          CustomList(
                            chargeType: 'Total',
                            amount: c.money(c.total),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.CHECKOUT),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Text(
                            'Review Payment and address',
                            style: AppTextStyles.medium18,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
