import 'package:al_khalifa/app/modules/checkout/views/payment_method.dart';
import 'package:al_khalifa/app/modules/common/customList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/app_text_styles.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxBodyWidth =
                680.0;
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxBodyWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery Address', style: AppTextStyles.medium18),
                      SizedBox(height: 12.h),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Dhaka',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Special Instructions',
                        style: AppTextStyles.medium18,
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'enter your full address',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text('Payment Method', style: AppTextStyles.medium18),
                      SizedBox(height: 8.h),
                      const PaymentMethod(paymentWay: 'Bkash'),
                      const PaymentMethod(paymentWay: 'Cash'),
                      SizedBox(height: 16.h),
                      Text('Order Summary', style: AppTextStyles.medium18),
                      SizedBox(height: 8.h),
                      const Customlist(
                        chargeType: '1x Basmati Kacchi',
                        amount: '300 Tk',
                      ),
                      const Customlist(
                        chargeType: '1x Basmati Kacchi 1:1',
                        amount: '20 Tk',
                      ),
                      SizedBox(height: 8.h),
                      Divider(height: 24.h, thickness: 1),
                      const Customlist(
                        chargeType: 'Subtotal',
                        amount: '520 Tk',
                      ),
                      const Customlist(
                        chargeType: 'Delivery Fee',
                        amount: '20 Tk',
                      ),
                      const Customlist(
                        chargeType: 'Platform fee',
                        amount: '50 Tk',
                      ),
                      const Customlist(chargeType: 'VAT', amount: '0 Tk'),
                      SizedBox(height: 8.h),
                      Divider(height: 24.h, thickness: 1),
                      const Customlist(chargeType: 'Total', amount: '620 Tk'),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Checkout',
                            style: AppTextStyles.medium18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
