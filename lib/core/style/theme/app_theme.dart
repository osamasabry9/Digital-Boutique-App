import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:digital_boutique/core/style/fonts/font_family_helper.dart';
import 'package:digital_boutique/core/style/theme/color_extension.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/app_bar_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/checkbox_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/chip_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/elevated_button_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/outlined_button_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/text_field_theme.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[AppColors.dark],
    useMaterial3: true,
    fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[AppColors.light],
    useMaterial3: true,
    fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
  );
}
