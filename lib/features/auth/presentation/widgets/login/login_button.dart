import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/common/widgets/custom_linear_button.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.loggedSuccessfully),
            );
            if (userRole == 'admin') {
              context.pushNamedAndRemoveUntil(Routes.homeAdminScreen);
            } else {
              context.pushNamedAndRemoveUntil(Routes.homeScreenUser);
            }
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message: context.translate(message),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => _buildWhen(context, isElse: false),
          orElse: () => _buildWhen(
            context,
          ),
        );
      },
    );
  }

  CustomFadeInRight _buildWhen(BuildContext context, {bool isElse = true}) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        onPressed: () => isElse ? _validateThenDoLogin(context) : null,
        height: AppSizes.buttonHeightLg,
        width: double.infinity,
        child: isElse
            ? TextApp(
                text: context.translate(LangKeys.login),
                theme: Theme.of(context).textTheme.headlineSmall!,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
