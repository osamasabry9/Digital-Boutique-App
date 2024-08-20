import 'package:digital_boutique/app/env.variables.dart';
import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/service/push_notification/notification_help.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationCloudHelper {
  factory NotificationCloudHelper() => _instance;

  NotificationCloudHelper._();

  static final NotificationCloudHelper _instance = NotificationCloudHelper._();

  static const String subscribeKey = 'digital_boutique';

  final _firebaseMessaging = FirebaseMessaging.instance;

  ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(true);

  bool isPermissionNotification = false;

  Future<void> init() async {
    //permission
    await _permissionsNotification();

    // // foreground
    // FirebaseMessaging.onMessage
    //     .listen(FirebaseMessagingNavigate.forGroundHandler);

    // // terminated
    // await FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then(FirebaseMessagingNavigate.terminatedHandler);

    // // background
    // FirebaseMessaging.onMessageOpenedApp
    //     .listen(FirebaseMessagingNavigate.backGroundHandler);
  }

  /// controller for the notification if user subscribe or unsubscribed
  /// or accepted the permission or not

  Future<void> controllerForUserSubscribe(BuildContext context) async {
    if (isPermissionNotification == false) {
      await _permissionsNotification();
    } else {
      if (isNotificationSubscribe.value == false) {
        await _subscribeNotification();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.subscribedToNotifications),
          seconds: 2,
        );
      } else {
        await _unSubscribeNotification();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.unsubscribedToNotifications),
          seconds: 2,
        );
      }
    }
  }

  /// permissions to notifications
  Future<void> _permissionsNotification() async {
    final settings = await _firebaseMessaging.requestPermission(badge: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /// subscribe to notifications topic
      isPermissionNotification = true;
      await _subscribeNotification();
      debugPrint('🔔🔔 User accepted the notification permission');
    } else {
      isPermissionNotification = false;
      isNotificationSubscribe.value = false;
      debugPrint('🔕🔕 User not accepted the notification permission');
    }
  }

  /// subscribe notification

  Future<void> _subscribeNotification() async {
    isNotificationSubscribe.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(subscribeKey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  /// unsubscribe notification

  Future<void> _unSubscribeNotification() async {
    isNotificationSubscribe.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscribeKey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }

// send notification with api
  Future<void> sendTopicNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final serverKeyAuthorization = await NotificationHelp().getAccessToken();
      final response = await Dio().post<dynamic>(
        EnvVariable.instance.notificationBaseUrl,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $serverKeyAuthorization',
          },
        ),
        data: {
        'message': {
        'topic': subscribeKey,
        'notification': {'title': title, 'body': body},
        'data': {'productId': productId},
         },
        },
      );

      debugPrint('Notification Created => ${response.data}');
    } catch (e) {
      debugPrint('Notification Error => $e');
    }
  }
}
