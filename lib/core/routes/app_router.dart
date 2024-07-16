import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/common/screens/under_build_screen.dart';
import 'package:digital_boutique/core/routes/base_routes_animation.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/features/admin/presentaion/home_screen_admin.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_boutique/features/auth/presentation/screens/login_screen.dart';
import 'package:digital_boutique/features/auth/presentation/screens/sign_uo_screen.dart';
import 'package:digital_boutique/features/customer/presentation/home_screen_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case Routes.noNetworkScreen:
        return BaseRouteAnimation(page: const NoNetworkScreen());
      case Routes.loginScreen:
        return BaseRouteAnimation(
          page: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return BaseRouteAnimation(page: const SignUpScreen());

      case Routes.homeScreenAdmin:
          return BaseRouteAnimation(page: const HomeScreenAdmin());
      case Routes.homeScreenUser:
          return BaseRouteAnimation(page: const HomeScreenUser());
      default:
        return BaseRouteAnimation(page: const PageUnderBuildScreen());
    }
  }
}
