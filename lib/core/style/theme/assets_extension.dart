import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.bigNavBar,
    required this.homeBg,
  });

  final String? bigNavBar;
  final String? homeBg;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  @override
  ThemeExtension<MyAssets> lerp(
    covariant ThemeExtension<MyAssets>? other,
    double t,
  ) {
    if (other is! MyAssets) {
      return this;
    }
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  static const MyAssets dark = MyAssets(
    bigNavBar: AppImages.bigNavBarDark,
    homeBg: AppImages.homeBgDark,
  );
  static const MyAssets light = MyAssets(
    bigNavBar: AppImages.bigNavBarLight,
    homeBg: AppImages.homeBgLight,
  );
}
