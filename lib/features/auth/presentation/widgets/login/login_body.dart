import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/go_to_screen.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/login/login_button.dart';
import 'package:digital_boutique/features/auth/presentation/widgets/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
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
            SizedBox(height: 50.h),

            // Welcome Info
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            SizedBox(height: 30.h),

            // Login Form
            const LoginForm(),
            SizedBox(height: 30.h),

            //LoginButton
            const LoginButton(),
            SizedBox(height: 30.h),

            // Go to Sign Up screen
            const GoToScreen(
              title: LangKeys.createAccount,
              routeName: Routes.signUpScreen,
            ),
          ],
        ),
      ),
    );
  }
}
