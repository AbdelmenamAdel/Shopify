import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/dialogs/custom_dialogs.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/core/utils/app_logout.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: 'Do you want log out?',
              textButton1: 'Yes',
              textButton2: 'No',
              isLoading: false,
              onPressed: () async {
                await AppLogout().logout();
              },
            );
          },
          icon: const Icon(Icons.logout_outlined),
        ),
        title: const Text('Customer Home'),
      ),
      body: const Center(
        child: NotificationsSettings(),
      ),
    );
  }
}

class NotificationsSettings extends StatelessWidget {
  const NotificationsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_active_outlined,
          color: context.textStyle.color,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.notifications),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        ValueListenableBuilder(
          valueListenable: FirebaseCloudMessaging().isSubscribe,
          builder: (_, value, __) {
            return Transform.scale(
              scale: 1,
              child: Switch.adaptive(
                inactiveTrackColor: const Color(0XFF262626),
                activeColor: Colors.green,
                value: value,
                onChanged: (value) {
                  FirebaseCloudMessaging()
                      .controllerForUserSubscription(context);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
