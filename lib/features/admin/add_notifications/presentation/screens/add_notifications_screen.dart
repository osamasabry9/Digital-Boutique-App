import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:flutter/material.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Add Notifications',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
      body: Center(child: Text('AddNotificationsScreen')),
    );
  }
}
