import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopify/features/admin/notifications/data/models/push_notification_model.dart';
import 'package:shopify/features/customer/favorites/data/models/favorites_model.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  Box<PushNotificationModel>? notificationBox;
  Box<FavoritesModel>? favoritesBox;
  Future<void> init() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(PushNotificationModelAdapter())
      ..registerAdapter(FavoritesModelAdapter());

    notificationBox =
        await Hive.openBox<PushNotificationModel>('notifications_box');

    favoritesBox = await Hive.openBox<FavoritesModel>('favorites_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
  }
}
