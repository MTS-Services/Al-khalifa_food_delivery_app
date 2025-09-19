import 'package:al_khalifa/app/data/app_colors.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Address', style: AppTextStyles.medium18),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Dhaka',
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
              ),
              Text('Special Instructions', style: AppTextStyles.medium18),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'enter your full address'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Payment Method', style: AppTextStyles.medium18),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: AppColors.greyColor
                        )
                      ),
                    ),
                  ),
                  Text('Bkash', style: AppTextStyles.medium16),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(),
                    ),
                  ),
                  Text('Cash', style: AppTextStyles.medium16),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Order Summary', style: AppTextStyles.medium18),
              ),
              Customlist(chargeType: '1x Basmati Kacchi', amount: '300 Tk'),
              Customlist(chargeType: '1x Basmati Kacchi 1:1', amount: '20 Tk'),
              Divider(),
              Customlist(chargeType: 'Subtotal', amount: '520 Tk'),
              Customlist(chargeType: 'Delivery Fee', amount: '20 Tk'),
              Customlist(chargeType: 'Platform fee', amount: '50 Tk'),
              Customlist(chargeType: 'VAT', amount: '0 Tk'),
              Divider(),
              Customlist(chargeType: 'Total', amount: '620 Tk'),
              SizedBox(height: 10.h,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Checkout', style: AppTextStyles.medium18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
