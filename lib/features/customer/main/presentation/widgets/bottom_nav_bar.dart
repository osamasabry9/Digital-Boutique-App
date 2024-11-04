import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:digital_boutique/features/customer/main/presentation/widgets/icon_tap_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 103.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Icons
              Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    height: 88.h,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 45.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // home screen
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.svgHomeTabIcon,
                                isSelected: true,
                              ),
                              // Category screen
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.svgCategoriesTapIcon,
                                isSelected: false,
                              ),
                              // Favorite screen
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.svgFavoriteTabIcon,
                                isSelected: true,
                              ),
                              // Profile screen
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.svgProfileTabIcon,
                                isSelected: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // BackGround Icon
              Positioned(
                top: -12,
                left: -8,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.bigNavBarDark),
                    ),
                  ),
                ),
              ),
              //Car Icon
              Positioned(
                left: 35,
                top: 17,
                child: SvgPicture.asset(
                  AppImages.svgCarShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
