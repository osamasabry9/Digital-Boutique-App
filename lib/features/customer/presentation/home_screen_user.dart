import 'package:digital_boutique/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:flutter/material.dart';


class HomeScreenUser extends StatelessWidget {
  const HomeScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Customer')),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: NotificationCloudHelper().isNotificationSubscribe,
          builder: (_, value, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value ? 'Subscribe' : 'Unsubscribe',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                Transform.scale(
                  scale: 1.4,
                  child: Switch.adaptive(
                    value: value,
                    inactiveTrackColor: const Color(0xff262626),
                    activeColor: Colors.green,
                    onChanged: (value) async {
                      await NotificationCloudHelper()
                          .controllerForUserSubscribe(context);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
