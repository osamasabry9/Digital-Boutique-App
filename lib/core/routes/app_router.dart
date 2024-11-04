import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/common/screens/under_build_screen.dart';
import 'package:digital_boutique/core/routes/base_routes_animation.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/features/admin/home_admin/presentation/screens/home_admin_screen.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_boutique/features/auth/presentation/screens/login_screen.dart';
import 'package:digital_boutique/features/auth/presentation/screens/sign_uo_screen.dart';
import 'package:digital_boutique/features/customer/main/presentation/screen/main_screen.dart';

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
        return BaseRouteAnimation(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<UploadImageCubit>()),
              BlocProvider(create: (context) => getIt<AuthBloc>()),
            ],
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeAdminScreen:
        return BaseRouteAnimation(page: const HomeAdminScreen());
      case Routes.mainScreen:
        return BaseRouteAnimation(page: const MainScreen());
      default:
        return BaseRouteAnimation(page: const PageUnderBuildScreen());
    }
  }
}
