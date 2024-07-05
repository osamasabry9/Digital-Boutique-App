import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/common/screens/under_build_screen.dart';
import 'package:digital_boutique/core/routes/base_routes.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/home_screen.dart';
import 'package:flutter/material.dart';




class AppRouter {
  static Route<void>  onGenerateRoute(RouteSettings settings) {
   //final args = settings.arguments;
    switch (settings.name) {
      case Routes.noNetworkScreen:
        return BaseRoute(page: const NoNetworkScreen());
      case Routes.homeScreen:
        return BaseRoute(page: const HomeScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
