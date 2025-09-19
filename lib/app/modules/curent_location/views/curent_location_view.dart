import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/curent_location/views/customProfileTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/curent_location_controller.dart';
import 'dropdown_button.dart';

class CurentLocationView extends GetView<CurentLocationController> {
  CurentLocationView({super.key});

  final List<String> district = ['Dhaka', 'Cumilla', 'Chittagong', 'Rajshahi'];
  final List<String> city = ['Dhaka', 'Dhanmondi', 'Uttora', 'Mirpur'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Edit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProfileTextField(
              label: 'Name',
              hintText: 'Md. Al Arafat Shiddik',
            ),
            CustomProfileTextField(
              label: 'Contract Number',
              hintText: 'Example: 01xxx-xxxxxx',
            ),
            CustomProfileTextField(
              label: 'Email',
              hintText: 'company@gmail.com',
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('District', style: AppTextStyles.medium16),
                      const SizedBox(height: 8),
                      Obx(() {
                        return AppDropdown<String>(
                          items: district,
                          value:
                              (controller.selectedDistrict.value ?? '').isEmpty
                              ? null
                              : controller.selectedDistrict.value,
                          onChanged: (v) {
                            controller.selectedDistrict.value = v ?? '';
                          },
                          hintText: 'Select District',
                          borderColor: AppColors.strokeColor,
                          textStyle: AppTextStyles.regular14,
                          hintStyle: AppTextStyles.regular14.copyWith(
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.only(top: 8),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City', style: AppTextStyles.medium16),
                      const SizedBox(height: 8),
                      Obx(() {
                        return AppDropdown<String>(
                          items: city,
                          value: (controller.selectedCity.value ?? '').isEmpty
                              ? null
                              : controller.selectedCity.value,
                          onChanged: (v) {
                            controller.selectedCity.value = v ?? '';
                          },
                          hintText: 'Select District',
                          borderColor: AppColors.strokeColor,
                          textStyle: AppTextStyles.regular14,
                          hintStyle: AppTextStyles.regular14.copyWith(
                            color: AppColors.greyColor,
                          ),
                          padding: const EdgeInsets.only(top: 8),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
            CustomProfileTextField(
              label: 'Address',
              hintText: 'Example: House no 32,street,etc',
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Save', style: AppTextStyles.medium18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
