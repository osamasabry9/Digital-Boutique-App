import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/utils/validators/validation.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isShowPassword = true;

late AuthBloc _authBloc;

@override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _authBloc.emailController.dispose();
    _authBloc.passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authBloc.formKey,
      child: Column(
        children: [
          // Email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _authBloc.emailController,
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
              controller: _authBloc.passwordController,
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
