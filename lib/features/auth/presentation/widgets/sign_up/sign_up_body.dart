import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/go_to_screen.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingH,
        vertical: AppSizes.paddingV,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Dark Mode & Language Buttons
            const DarkAndLangButtons(),
            SizedBox(height: 30.h),

            // Welcome Info
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),

            SizedBox(height: 10.h),

            // user avatar image
            const UserAvatarImage(),

            SizedBox(height: 20.h),

            // Sign Up Form
            const SignUpForm(),
            SizedBox(height: 20.h),

            // Sign Up Button
            const SignUpButton(),
            SizedBox(height: 20.h),

            // Go to Login screen
            const GoToScreen(
              title: LangKeys.youHaveAccount,
              routeName: Routes.loginScreen,
            ),
          ],
        ),
      ),
    );
  }
}
