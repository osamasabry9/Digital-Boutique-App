import 'package:digital_boutique/app/env.variables.dart';
import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/language/app_localizations_setup.dart';
import 'package:digital_boutique/core/routes/app_router.dart';
import 'package:digital_boutique/core/style/theme/app_theme.dart';
import 'package:digital_boutique/core/utils/helpers/connectivity_controller.dart';
import 'package:digital_boutique/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitalBoutiqueApp extends StatelessWidget {
  const DigitalBoutiqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, isConnected, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: Builder(
            builder: (_) {
              return MaterialApp(
                title: isConnected ? 'Digital Boutique' : 'No Network',
                debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                theme: themeDark(),
                locale: const Locale('en'),
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                builder: (context, widget) {
                  if (isConnected) {
                    ConnectivityController.instance.init();
                    return GestureDetector(
                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                      child: Scaffold(
                        body: widget,
                      ),
                    );
                  } else {
                    return widget!;
                  }
                },
                onGenerateRoute: AppRouter.onGenerateRoute,
                home: isConnected ? const HomeScreen() : const NoNetworkScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
