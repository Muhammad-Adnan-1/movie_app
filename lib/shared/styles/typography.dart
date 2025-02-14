import 'package:movies_app/shared/styles/color.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static TextTheme getTextLightTheme() => TextTheme(
    headlineLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.5,
      color: AppColors.blackColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      color: AppColors.blackColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      color: AppColors.blackColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.5,
      color: AppColors.blackColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.25,
      color: AppColors.blackColor,
    ),
    bodySmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.4,
      color: AppColors.subtitleColor,
    ),
    titleLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
      color: AppColors.blackColor,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.1,
      color: AppColors.blackColor,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
      color: AppColors.whiteColor,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
      color: AppColors.blackColor,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
      color: AppColors.greyColor,
    ),
  );
}

