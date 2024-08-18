import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/language/app_localizations_setup.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/styles/theme/app_theme.dart';

class Shopify extends StatelessWidget {
  const Shopify({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en', 'US'),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
          theme: themeDark(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: AppRoutes.login,
        ),
      ),
    );
  }
}
