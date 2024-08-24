import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/app/app.dart';
import 'package:shopify/core/app/bloc_observer.dart';
import 'package:shopify/core/app/env.variables.dart';
import 'package:shopify/core/common/widgets/error_widget.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterErrorWidget();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  await Firebase.initializeApp();
  await SharedPref().instantiatePreferences();
  await setupInjector();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const ConnectivityCheck());
  });
}
