import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widget/custome_location_row.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CustomLocationRow(
                selectedLocation: "Dhaka",
                locations: ["Dhaka", "Chittagong", "Khulna"],
                onLocationChanged: (value) {
                  print("Selected: $value");
                },
                onNotificationTap: () {
                  print("Notification tapped!");
                },
              ),
              SearchBar(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                elevation: WidgetStateProperty.all(0.0),
                leading: Icon(Icons.search),
                hintText: "Search for food",
                onChanged: (value) {
                  print("Searching: $value");
                },
              )
            ],
          ),
        ),
      ),
    );

  }
}
