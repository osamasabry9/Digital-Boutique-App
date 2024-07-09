import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:digital_boutique/core/style/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: ColorsLight.black, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ColorsLight.black, size: AppSizes.iconMd),
    titleTextStyle: AppTextTheme.lightTextTheme.titleLarge!
        .copyWith(fontSize: AppSizes.fontSizeGeneral),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: ColorsDark.black1, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ColorsDark.white, size: AppSizes.iconMd),
    titleTextStyle: AppTextTheme.darkTextTheme.titleLarge!
        .copyWith(fontSize: AppSizes.fontSizeGeneral),
  );
}
