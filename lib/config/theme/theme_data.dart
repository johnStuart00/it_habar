import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_habar/core/constants/app_color.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.grey,
        selectedIconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.ebGaramond(
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.ebGaramond(
          fontSize: 18,
          color: AppColors.black,
        ),
        bodySmall: GoogleFonts.ebGaramond(
          fontSize: 16,
          color: AppColors.grey,
        ),
        titleSmall: GoogleFonts.ebGaramond(
          fontSize: 14,
          color: AppColors.blue,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.ebGaramond(
          fontSize: 22,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.ebGaramond(
          fontSize: 16,
          color: AppColors.white,
        ),
        headlineSmall: GoogleFonts.ebGaramond(
          fontSize: 14,
          color: AppColors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
      dividerColor: AppColors.black,
      indicatorColor: AppColors.red);

  static final ThemeData darkTheme = ThemeData();
}
