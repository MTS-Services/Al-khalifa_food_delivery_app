
import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:flutter/material.dart';



ThemeData themeData() {
  return ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.strokeColor),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.strokeColor),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          // textStyle: AppTextStyles.bold16,
        )
    ),
  );
}
