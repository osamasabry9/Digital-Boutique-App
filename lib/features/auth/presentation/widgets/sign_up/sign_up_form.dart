import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Name
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return context.translate(LangKeys.validName);
                }
                return null;
              },
              hintText: context.translate(LangKeys.fullName),
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: 25.h),

          // Email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              validator: (value) =>
                  AppValidators.validateEmail(value, context: context),
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 25.h),

          // Password
          CustomFadeInRight(
            duration: 300,
            child: CustomTextField(
              controller: TextEditingController(),
              validator: (value) =>
                  AppValidators.validatePassword(value, context: context),
              hintText: context.translate(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: context.color.textColor,
                ),
              ),
              obscureText: isShowPassword,
            ),
          ),
        ],
      ),
    );
  }
}
