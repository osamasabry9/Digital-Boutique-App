import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:digital_boutique/features/admin/home_admin/presentation/screens/menu_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  Widget page = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScreen(
            onPageChanged: (a) {
              setState(() {
                page = a;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}
