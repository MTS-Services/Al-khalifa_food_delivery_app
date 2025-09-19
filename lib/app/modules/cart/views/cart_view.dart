import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/common/customList.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/custom_cart_item.dart';
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

