import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopify/features/admin/notifications/data/models/push_notification_model.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  Box<PushNotificationModel>? notificationBox;
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PushNotificationModelAdapter());

    notificationBox =
        await Hive.openBox<PushNotificationModel>('notifications_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
  }
}
