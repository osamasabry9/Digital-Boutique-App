import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: CircleAvatar(
        radius: 38.r,
        backgroundImage: const AssetImage(AppImages.user),
      ),
    );
  }
}
