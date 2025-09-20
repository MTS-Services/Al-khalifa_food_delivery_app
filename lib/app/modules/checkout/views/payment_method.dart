import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';

class PaymentMethod extends StatelessWidget {
  final String paymentWay;

  const PaymentMethod({super.key, required this.paymentWay});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Container(
            height: 20.r,
            width: 20.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4.r,
                color: AppColors.greyColor,
              ),
            ),
          ),
        ),
        Text(paymentWay, style: AppTextStyles.medium16),
      ],
    );
  }
}
