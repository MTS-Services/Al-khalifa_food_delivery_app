import 'package:al_khalifa/app/modules/home/controllers/home_controller.dart';
import 'package:al_khalifa/app/modules/home/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_header.dart';
import '../widget/food_card.dart';

class SeeAllPopularScreen extends StatelessWidget {
  const SeeAllPopularScreen({super.key});

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
                  title: "Kitchen Menu",
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
    final screenWidth = Get.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;
    return GetBuilder<HomeController>(
      builder: (controller) {
        if(controller.popularDataInProgress){
          return Center(child: CircularProgressIndicator(),);
        }
        return GridView.builder(
          itemCount: controller.popularFoodItemList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final foodCard=controller.popularFoodItemList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailsScreen(popularItem: foodCard,));
              },
              child: FoodCard(
                imageUrl:foodCard.food.foodImageUrl ,
                title:foodCard.food.name,
                rating:foodCard.averageRating,
                price: foodCard.food.price,
                onAdd: () {},
                cardHeight: 135,
              ),
            );
          },
        );
      }
    );
  }
}
