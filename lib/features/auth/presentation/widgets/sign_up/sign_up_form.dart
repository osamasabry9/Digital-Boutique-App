import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/utils/validators/validation.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _bloc.nameController.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          // Name
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.nameController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 4) {
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
              controller: _bloc.emailController,
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
              controller: _bloc.passwordController,
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
