import 'package:digital_boutique/core/common/widgets/custom_linear_button.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {},
      height: AppSizes.buttonHeightLg,
      width: double.infinity,
      child: TextApp(
        text: context.translate(LangKeys.login),
        theme: Theme.of(context).textTheme.headlineSmall!,
      ),
    );
  }
}
