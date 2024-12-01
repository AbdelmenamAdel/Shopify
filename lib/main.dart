import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/app/app.dart';
import 'package:shopify/core/app/bloc_observer.dart';
import 'package:shopify/core/app/env.variables.dart';
import 'package:shopify/core/common/widgets/error_widget.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/services/dynamic_link/dynamic_link.dart';
import 'package:shopify/core/services/hive/hive_database.dart';
import 'package:shopify/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:shopify/core/services/push_notification/local_notfication_service.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterErrorWidget();
  Bloc.observer = AppBlocObserver();
  await SharedPref().instantiatePreferences();
  await Future.wait(
    [
      EnvVariable.instance.init(envType: EnvTypeEnum.dev),
      setupInjector(),
      Firebase.initializeApp(),
      HiveDatabase().init(),
    ],
  );
  await Future.wait([
    FirebaseCloudMessaging().init(),
    DynamicLink().initDynamicLink(),
  ]);
  await LocalNotificationService.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const ConnectivityCheck());
  });
}
