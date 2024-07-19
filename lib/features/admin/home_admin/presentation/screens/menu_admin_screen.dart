import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/constants/app_constants.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:digital_boutique/core/utils/admin_drawer/admin_drawer_list.dart';
import 'package:flutter/material.dart';

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({required this.onPageChanged, super.key});

  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: const AdminAppBar(
        isMain: false,
        backgroundColor: ColorsDark.blueDark,
        title: AppConstants.appName,
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context)
                .map(
                  (e) => ListTile(
                    onTap: () {
                      onPageChanged(e.page);
                    },
                    title: e.title,
                    leading: e.icon,
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: Image.asset(
              AppImages.logoDark1,
            ),
          ),
        ],
      ),
    );
  }
}
