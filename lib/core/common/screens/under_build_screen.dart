import 'package:digital_boutique/core/style/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageUnderBuildScreen extends StatelessWidget {
  const PageUnderBuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints:  BoxConstraints.expand(
          height: 200.h,
          width: double.infinity,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.pageUnderBuild),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}