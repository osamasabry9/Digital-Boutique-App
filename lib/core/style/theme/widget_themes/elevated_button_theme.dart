import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorsLight.white,
      backgroundColor: ColorsLight.primary,
      disabledForegroundColor: ColorsLight.darkGrey,
      disabledBackgroundColor: ColorsLight.buttonDisabled,
      side:  const BorderSide(color: ColorsLight.primary),
      padding:  EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      textStyle: AppTextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorsDark.white,
      backgroundColor: ColorsDark.primary,
      disabledForegroundColor: ColorsDark.darkGrey,
      disabledBackgroundColor: ColorsDark.darkerGrey,
      side:  const BorderSide(color: ColorsDark.primary),
      padding:  EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      textStyle:  AppTextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}
