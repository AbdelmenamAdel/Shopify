import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/app/env.variables.dart';
import 'package:shopify/core/common/toast/show_toast.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/language/lang_keys.dart';
import 'package:shopify/core/services/push_notification/firebase_messaging_navigate.dart';
import 'package:shopify/core/services/push_notification/get_server_key_token.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;

  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  static const String subscriptionKey = 'Shopify';

  final _firebaseMessaging = FirebaseMessaging.instance;
  ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(true);

  bool isPermissionNotification = false;

  Future<void> init() async {
    //permission
    await _permissionsNotification();

    // forground
    FirebaseMessaging.onMessage
        .listen(FirebaseMessagingNavigate.forGroundHandler);

    // terminated
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then(FirebaseMessagingNavigate.terminatedHandler);

    // background
    FirebaseMessaging.onMessageOpenedApp
        .listen(FirebaseMessagingNavigate.backGroundHandler);
  }

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
    await FirebaseMessaging.instance.subscribeToTopic(subscriptionKey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  /// unsubscribe notification

  Future<void> _unSubscribeNotification() async {
    isNotificationSubscribe.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscriptionKey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }

// send notifcation with api
  Future<void> sendTopicNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    final accessToken = await GetServerKeyToken().getServerKeyToken();
    log(accessToken);
    final message = {
      'message': {
        'topic': subscriptionKey,
        'notification': {
          'title': title,
          'body': body,
        },
        'data': {'productId': productId},
      },
    };
    try {
      final response = await Dio().post<dynamic>(
        EnvVariable.instance.notifcationBaseUrl,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Notification sent successfully!');
        }
      } else {
        if (kDebugMode) {
          print('Failed to send notification: ${response.data}');
        }
      }
    } catch (e) {
      debugPrint('Notification Error => $e');
    }
  }
}
// https://fcm.googleapis.com/v1/projects/shopify-761e9/messages:send