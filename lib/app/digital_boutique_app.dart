import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/app/env.variables.dart';
import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/cubits/app_cubit/app_cubit.dart';
import 'package:digital_boutique/core/language/app_localizations_setup.dart';
import 'package:digital_boutique/core/routes/app_router.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:digital_boutique/core/service/shared_pref/pref_keys.dart';
import 'package:digital_boutique/core/service/shared_pref/shared_pref.dart';
import 'package:digital_boutique/core/style/theme/app_theme.dart';
import 'package:digital_boutique/core/utils/helpers/connectivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitalBoutiqueApp extends StatelessWidget {
  const DigitalBoutiqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, isConnected, __) {
        if (isConnected) {
          return BlocProvider(
            create: (context) => getIt<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'Digital Boutique',
                    debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                    theme: cubit.isDark ? themeLight() : themeDark(),
                    locale: Locale(cubit.currentLangCode),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnectivityController.instance.init();
                              return widget!;
                            },
                          ),
                        ),
                      );
                    },
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    initialRoute: isLoggedInUser
                        ? isAdmin
                            ? Routes.homeScreenAdmin
                            : Routes.homeScreenUser
                        : Routes.loginScreen,
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network ',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            themeMode: ThemeMode.system,
            darkTheme: themeDark(),
            theme: themeLight(),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
