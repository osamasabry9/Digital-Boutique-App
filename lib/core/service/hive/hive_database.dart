import 'package:digital_boutique/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<AddNotificationModel>? notificationBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AddNotificationModelAdapter());

    notificationBox =
        await Hive.openBox<AddNotificationModel>('notification_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
  }
}
