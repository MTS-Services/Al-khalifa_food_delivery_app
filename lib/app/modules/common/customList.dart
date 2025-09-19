import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/app_text_styles.dart';

class Customlist extends StatelessWidget {
  final String chargeType;
  final String amount;

  const Customlist({super.key, required this.chargeType, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h), // responsive padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(chargeType, style: AppTextStyles.regular14),
          Text(amount, style: AppTextStyles.regular14),
        ],
      ),
    );
  }
}
