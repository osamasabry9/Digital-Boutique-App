import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: Theme.of(context).textTheme.headlineMedium!,
          ),
          SizedBox(height: 10.h),
          TextApp(
            text: description,
            theme: Theme.of(context).textTheme.titleSmall!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
