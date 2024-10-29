import 'package:flutter/material.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/notifications/presentation/refactors/push_notification_body.dart';

class PushNotificationsView extends StatelessWidget {
  const PushNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Notifications',
      ),
      body: PushNotificationBody(),
    );
  }
}
