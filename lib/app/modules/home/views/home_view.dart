import 'package:al_khalifa/app/modules/home/views/product_details_screen.dart';
import 'package:al_khalifa/app/modules/home/views/see_all_meal_for_one_screen.dart';
import 'package:al_khalifa/app/modules/home/views/see_all_popular_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/app_colors.dart';
import '../../../data/image_path.dart';
import '../controllers/home_controller.dart';
import '../widget/custom_header.dart';
import '../widget/custome_location_row.dart';
import '../widget/food_card.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final TextEditingController _searchTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildCustomLocationRow(),
                const SizedBox(height: 8),
                _buildSearchBar(),
                const SizedBox(height: 20),
                _buildContainer(),
                const SizedBox(height: 20),
                // Header
                CustomHeader(title: "Our Cuisines"),
                const SizedBox(height: 10),
                _buildProduct(),
                CustomHeader(
                  title: "Popular",
                  seeAllText: "See All",
                  onSeeAllTap: () {
                    Get.to(() => SeeAllPopularScreen());
                  },
                ),
                const SizedBox(height: 10),
                _buildPopularGridView(),
                const SizedBox(height: 10),
                CustomHeader(
                  title: "Meal For One",
                  seeAllText: "See All",
                  onSeeAllTap: () {
                    Get.to(() => SeeAllMealForOneScreen());
                  },
                ),
                const SizedBox(height: 5),
                Text("Delivery fee included!", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                _buildMealForOneGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMealForOneGridView() {
    return GridView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => ProductDetailsScreen());
          },
          child: FoodCard(
            imageUrl: ImagePath.foodImage,
            title: "Spicy Sausage",
            rating: 5.0,
            price: 495,
            onAdd: () {
              print("Added Spicy Sausage!");
            },
          ),
        );
      },
    );
  }

  Widget _buildPopularGridView() {
    return GridView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => ProductDetailsScreen());
          },
          child: FoodCard(
            imageUrl: ImagePath.foodImage,
            title: "Spicy Sausage",
            rating: 5.0,
            price: 495,
            onAdd: () {
              print("Added Spicy Sausage!");
            },
          ),
        );
      },
    );
  }

  Widget _buildProduct() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 160,
              child: FoodCard(
                imageUrl: ImagePath.foodImage,
                title: "Rooftop menu",
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Share the love",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 10),
                Text(
                  "Enjoy \n30% off",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Code : Developer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 60),
            Image.asset(ImagePath.footItem, height: 200),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomLocationRow() {
    return CustomLocationRow(
      selectedLocation: "Dhaka",
      locations: ["Dhaka", "Chittagong", "Khulna"],
      onLocationChanged: (value) {
        print("Selected: $value");
      },
      onNotificationTap: () {
        print("Notification tapped!");
      },
    );
  }

  Widget _buildSearchBar() {
    return SearchBar(
      controller: _searchTEController,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevation: WidgetStateProperty.all(0.0),
      leading: const Icon(
        Icons.search,
        size: 30,
        color: AppColors.searchIconColor,
      ),
      hintText: "Search for food",
      hintStyle: WidgetStateProperty.all(
        TextStyle(
          color: AppColors.searchIconColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      onChanged: (value) {
        print("Searching: $value");
      },
    );
  }
}
