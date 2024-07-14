import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/custom_linear_button.dart';
import 'package:digital_boutique/core/cubits/app_cubit/app_cubit.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/app_localizations.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        // Language button
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44.h,
            width: 100.w,
            child: Text(
              context.translate(LangKeys.language),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
