import 'package:digital_boutique/app/env.variables.dart';
import 'package:digital_boutique/core/common/screens/no_network_screen.dart';
import 'package:digital_boutique/core/utils/helpers/connectivity_controller.dart';
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
          child: MaterialApp(
            title: isConnected ? 'Digital Boutique' : 'No Network',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            builder: (context, widget) {
              if (isConnected) {
                ConnectivityController.instance.init();
                return Scaffold(
                  body: widget,
                );
              } else {
                return widget!;
              }
            },
            home: isConnected
                ? Scaffold(
                    appBar: AppBar(
                      title: const Text('Digital Boutique'),
                    ),
                  )
                : const NoNetworkScreen(),
          ),
        );
      },
    );
  }
}
