
import 'package:flutter/material.dart';
import 'package:movies_app/shared/styles/color.dart';
import 'package:movies_app/shared/styles/typography.dart';

var lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    dividerColor: AppColors.greyColor,
    fontFamily: "Poppins",
    cardColor: AppColors.grey200Color,
    disabledColor: AppColors.grey400Color,
    secondaryHeaderColor: AppColors.blackColor.withOpacity(0.1),
    brightness: Brightness.light,
    textTheme: AppTypography.getTextLightTheme(),
    appBarTheme: AppBarTheme(
      color: AppColors.whiteColor
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.blackColor),
        foregroundColor: WidgetStatePropertyAll(AppColors.whiteColor),

      )
    ),

    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.whiteColor,
        secondary: AppColors.blackColor,
        onSecondary: AppColors.whiteColor,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.whiteColor,
        onSurface: AppColors.blackColor,

    ));
