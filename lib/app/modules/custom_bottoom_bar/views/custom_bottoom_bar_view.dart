import 'package:al_khalifa/app/data/app_colors.dart';
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
  final List pages = const [HomeView(), CartView(), OrderView(), ProfileView()];
  const CustomBottoomBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeTab,
          backgroundColor: Colors.white,
          elevation: 10,
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
        height: 25.h,
        width: 28.w,
        color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
      ),
      label: label,
    );
  }
}
