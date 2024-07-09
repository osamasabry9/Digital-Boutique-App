import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/colors/colors_light.dart';
import 'package:digital_boutique/core/style/fonts/font_family_helper.dart';
import 'package:digital_boutique/core/style/theme/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[AppColors.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorsDark.white,
        fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[AppColors.light],
    useMaterial3: true,
     textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorsLight.black,
        fontFamily: FontFamilyHelper.getLocalizedFontFamily(),
      ),
    ),
  );
}
