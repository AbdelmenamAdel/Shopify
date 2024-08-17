import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify/app/app.dart';
import 'package:shopify/core/app/env.variables.dart';
import 'package:shopify/core/widgets/error_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterErrorWidget();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  Firebase.initializeApp();
  runApp(const Shopify());
}
