import 'package:flutter/material.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_text_styles.dart';

class CustomProfileTextField extends StatelessWidget {
  final String label;
  final String hintText;

  const CustomProfileTextField({
    super.key,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(label, style: AppTextStyles.medium18),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.regular14.copyWith(
              color: AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
