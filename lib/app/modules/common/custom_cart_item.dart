/*
class CustomCartItem extends StatelessWidget {
  final CartItem cartItemModel;
  CustomCartItem({super.key, required this.cartItemModel});

  final controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    print(cartItemModel.food.foodImageUrl);
    print(cartItemModel.food.name);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.greyLightColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image:  DecorationImage(
                    image: NetworkImage(cartItemModel.food.foodImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemModel.food.name,
                      style: AppTextStyles.medium14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.h),
                    Obx(
                          () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: controller.increment,
                            child: Container(
                              height: 20.r,
                              width: 20.r,
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
                            child: Text("${controller.count.value}",
                                style: AppTextStyles.medium14),
                          ),
                          GestureDetector(
                            onTap: controller.decrement,
                            child: Container(
                              height: 20.r,
                              width: 20.r,
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

                    SizedBox(height: 6.h),
                    Text('260 Tk', style: AppTextStyles.medium14),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                children: [
                  SizedBox(height: 50.h,),
                  Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.primaryColor,
                    size: 24.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


import 'package:al_khalifa/app/modules/cart/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../data/app_colors.dart';
import '../../data/app_text_styles.dart';
import '../cart/controllers/cart_controller.dart';

class CustomCartItem extends StatelessWidget {
  final CartItem cartItemModel;
  CustomCartItem({super.key, required this.cartItemModel});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.greyLightColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: NetworkImage(cartItemModel.food.foodImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemModel.food.name,
                      style: AppTextStyles.medium14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.h),
                    GetBuilder<CartController>(
                      id: 'item_${cartItemModel.id}',
                      builder: (c) {
                        final qty = c.qtyOf(cartItemModel.id);
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => c.increment(cartItemModel.id),
                              child: _circleBtn('+'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text('$qty', style: AppTextStyles.medium14),
                            ),
                            GestureDetector(
                              onTap: () => c.decrement(cartItemModel.id),
                              child: _circleBtn('-'),
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 6.h),
                    // total price
                    GetBuilder<CartController>(
                      id: 'item_${cartItemModel.id}',
                      builder: (c) {
                        final qty = c.qtyOf(cartItemModel.id);
                        final total = cartItemModel.food.price * qty;
                        return Text('$total Tk', style: AppTextStyles.medium14);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  cartController.deleteCartData(cartItemModel.id);
                },
                child: Icon(
                  Icons.delete_outline_outlined,
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleBtn(String text) {
    return Container(
      height: 20.r,
      width: 20.r,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Text(text, style: AppTextStyles.regular10),
    );
  }
}
