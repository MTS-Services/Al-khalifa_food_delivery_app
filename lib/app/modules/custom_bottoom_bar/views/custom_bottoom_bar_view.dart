import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:al_khalifa/app/modules/cart/views/cart_view.dart';
import 'package:al_khalifa/app/modules/order/views/order_view.dart';
import 'package:al_khalifa/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/custom_bottoom_bar_controller.dart';

class CustomBottoomBarView extends GetView<CustomBottoomBarController> {
  final List<Widget> pages = [
    HomeView(),
    CartView(),
    OrderView(),
    ProfileView(),
  ];

  CustomBottoomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      // height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeTab,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.primaryTextColor,
          selectedLabelStyle: AppTextStyles.medium11.apply(
            color: AppColors.primaryColor,
          ),
          unselectedLabelStyle: AppTextStyles.bold11.apply(
            color: AppColors.primaryTextColor,
          ),
          items: [
            _buildItem(0, ImagePath.home, 'Home'),
            _buildItem(1, ImagePath.cart, 'Cart'),
            _buildItem(2, ImagePath.list, 'Orders'),
            _buildItem(3, ImagePath.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(int index, String iconPath, String label) {
    final isSelected = controller.currentIndex.value == index;
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        height: 30.h,
        width: 28.w,
        color: isSelected ? AppColors.primaryColor : AppColors.primaryTextColor,
      ),
      label: label,
    );
  }
}
