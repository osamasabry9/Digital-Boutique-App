import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, this.title = 'No Data'});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Opacity(
        opacity: 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.emptyScreen),
            TextApp(
              text: title!,
              theme: Theme.of(context).textTheme.headlineSmall!,
            ),
          ],
        ),
      ),
    );
  }
}
