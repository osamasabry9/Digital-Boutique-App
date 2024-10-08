import 'package:digital_boutique/core/service/push_notification/notification_help.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:digital_boutique/core/utils/helpers/app_logout.dart';

class HomeScreenUser extends StatelessWidget {
  const HomeScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Customer')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                AppLogout().logout();
              },
              child: const Text('Logout'),
            ),
            TextButton(
              onPressed: () {
                NotificationHelp().getAccessToken();
              },
              child: const Text('Get Token'),
            ),
            TextButton(
              onPressed: () async {
                final token = await FirebaseMessaging.instance.getToken();
                print('Token customer: $token');
              },
              child: const Text('Get Firebase Token'),
            ),
          ],
        ),
      ),
    );
  }
}
