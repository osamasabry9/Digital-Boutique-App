import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:digital_boutique/core/style/fonts/font_family_helper.dart';
import 'package:flutter/material.dart';

/// Custom Class for Light & Dark Text Themes
class AppTextTheme {
  AppTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeHeadLarge,
      fontWeight: FontWeight.bold,
      color: ColorsLight.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeHeadMedium,
      fontWeight: FontWeight.w600,
      color: ColorsLight.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeHeadSmall,
      fontWeight: FontWeight.w600,
      color: ColorsLight.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: ColorsLight.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w500,
      color: ColorsLight.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w400,
      color: ColorsLight.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeBody,
      fontWeight: FontWeight.w500,
      color: ColorsLight.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeBody,
      fontWeight: FontWeight.normal,
      color: ColorsLight.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeBody,
      fontWeight: FontWeight.w500,
      color: ColorsLight.black.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeLabel,
      fontWeight: FontWeight.normal,
      color: ColorsLight.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeLabel,
      fontWeight: FontWeight.normal,
      color: ColorsLight.black.withOpacity(0.5),
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeHeadLarge,
      fontWeight: FontWeight.bold,
      color: ColorsDark.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeHeadMedium,
      fontWeight: FontWeight.w600,
      color: ColorsDark.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeHeadSmall,
      fontWeight: FontWeight.w600,
      color: ColorsDark.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: ColorsDark.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w500,
      color: ColorsDark.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w400,
      color: ColorsDark.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeBody,
      fontWeight: FontWeight.w500,
      color: ColorsDark.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeBody,
      fontWeight: FontWeight.normal,
      color: ColorsDark.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeBody,
      fontWeight: FontWeight.w500,
      color: ColorsDark.white.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeLabel,
      fontWeight: FontWeight.normal,
      color: ColorsDark.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      fontSize: AppSizes.fontSizeLabel,
      fontWeight: FontWeight.normal,
      color: ColorsDark.white.withOpacity(0.5),
    ),
  );
}
