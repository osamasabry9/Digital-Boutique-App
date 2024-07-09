import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ColorsLight.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: ColorsLight.black),
    selectedColor: ColorsLight.primary,
    padding: EdgeInsets.symmetric(horizontal: AppSizes.s, vertical: AppSizes.s),
    checkmarkColor: ColorsLight.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ColorsDark.darkerGrey,
    labelStyle: const TextStyle(color: ColorsDark.white),
    selectedColor: ColorsDark.primary,
    padding: EdgeInsets.symmetric(horizontal: AppSizes.s, vertical: AppSizes.s),
    checkmarkColor: ColorsDark.white,
  );
}
