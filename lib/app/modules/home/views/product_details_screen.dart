import 'package:al_khalifa/app/modules/home/models/popular_food_item_model.dart';
import 'package:al_khalifa/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/image_path.dart';
import '../widget/custom_circle.dart';
import '../widget/custom_header.dart';
import '../widget/food_card.dart';

class ProductDetailsScreen extends StatelessWidget {

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                leadingIcon: Icons.arrow_back,
                onLeadingTap: () {
                  Get.back();
                },
              ),
              FoodCard(
                imageUrl: ImagePath.foodImage,
                title: "Spicy",
                rating: 5.0,
                price: 495,
              ),
              Text(
                "Popular dish prepared of slow-cooked \naromatic basmati  rice layered with potatoes \nmarinated mutton pcs, in a delicate blend of \nwhole spices",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 15),
              _buildTitleRow(),
              SizedBox(height: 15),
              SizedBox(
                height: 220,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _buildListTile("For 1 person", "Tk 190"),
                    _buildListTile("For 1 person", "Tk 190"),
                    _buildListTile("For 1 person", "Tk 190"),
                    _buildListTile("For 1 person", "Tk 190"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildAddToCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildCircleButton(Icons.remove, () {}),
            Text('', style: const TextStyle(fontSize: 24)),
            _buildCircleButton(Icons.add, () {}),
          ],
        ),
        CustomElevatedButton(onPressed: () {}, text: "Add to cart"),
      ],
    );
  }

  Widget _buildListTile(String title, String price) {
    return ListTile(
      leading: const CustomCircle(),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Text(price, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFFF2F2F2),
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.all(12),
      ),
      child: Icon(icon, size: 20),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Variation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Select one", style: TextStyle(fontSize: 15)),
          ],
        ),
        CustomElevatedButton(onPressed: () {}, text: "Required"),
      ],
    );
  }
}
