import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/custom_linear_button.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark mode button
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            child: const Icon(Icons.light_mode_outlined, color: Colors.white),
          ),
        ),

        // Language button
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            height: 44.h,
            width: 100.w,
            child: Text(context.translate(LangKeys.language), style: Theme.of(context).textTheme.titleLarge,),
          ),
        ),
      ],
    );
  }
}
