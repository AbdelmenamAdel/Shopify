import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';

class PushNotificationsView extends StatelessWidget {
  const PushNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: const AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Notifications',
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            FirebaseCloudMessaging().sendTopicNotification(
              title: 'test one',
              body: 'new offer product',
              productId: 1,
            );
          },
          child: const Text(
            'Push Notifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
