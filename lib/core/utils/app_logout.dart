import 'package:flutter/widgets.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/services/hive/hive_database.dart';
import 'package:shopify/core/services/shared_pref/pref_keys.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }

  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;
    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);
    await SharedPref().removePreference(PrefKeys.userRole);
    await HiveDatabase().clearAllBox();
    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(AppRoutes.login);
  }
}
