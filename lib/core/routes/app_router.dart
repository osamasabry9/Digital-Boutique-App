import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/common/screens/under_build_screen.dart';
import 'package:digital_boutique/core/routes/base_routes_animation.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/features/auth/presentation/screens/login_screen.dart';
import 'package:digital_boutique/features/auth/presentation/screens/sign_uo_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case Routes.noNetworkScreen:
        return BaseRouteAnimation(page: const NoNetworkScreen());
      case Routes.loginScreen:
        return BaseRouteAnimation(page: const LoginScreen());
      case Routes.signUpScreen:
        return BaseRouteAnimation(page: const SignUpScreen());
      default:
        return BaseRouteAnimation(page: const PageUnderBuildScreen());
    }
  }
}
