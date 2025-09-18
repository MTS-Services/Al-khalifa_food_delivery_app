import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widget/custome_location_row.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _buildCustomLocationRow(),
              const SizedBox(height: 8),
              _buildSearchBar(),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New here?Score \nfree delivery and \ndiscounts!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("Get started",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.arrow_forward , size: 30, color: Colors.white,)
                                ],
                              )
                            ],
                          ),
                          Image.asset("")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
