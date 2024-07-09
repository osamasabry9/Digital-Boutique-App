import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

/* -- Light & Dark Outlined Button Themes -- */
class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorsLight.black,
      side: const BorderSide(color: ColorsLight.borderPrimary),
      textStyle: AppTextTheme.lightTextTheme.titleLarge,
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.buttonPaddingV,
          horizontal: AppSizes.buttonPaddingH,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ColorsDark.light,
      side: const BorderSide(color: ColorsDark.borderPrimary),
      textStyle: AppTextTheme.darkTextTheme.titleLarge,
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.buttonPaddingV,
          horizontal: AppSizes.buttonPaddingH,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),),
    ),
  );
}
