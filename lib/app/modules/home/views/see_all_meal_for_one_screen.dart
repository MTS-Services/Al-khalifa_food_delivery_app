import 'package:al_khalifa/app/modules/home/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/image_path.dart';
import '../widget/custom_header.dart';
import '../widget/food_card.dart';

class SeeAllMealForOneScreen extends StatelessWidget {
  const SeeAllMealForOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                CustomHeader(
                  title: "Meal For One",
                  centerTitle: true,
                  leadingIcon: Icons.arrow_back,
                  onLeadingTap: (){
                    Get.back();
                  },
                ),
                _buildPopularGridView()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildPopularGridView() {
    return GridView.builder(
      itemCount: 6,
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
          onTap: (){
            Get.to(()=>ProductDetailsScreen());
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
}
