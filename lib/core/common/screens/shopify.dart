import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/app/app_cubit/app_cubit.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/language/app_localizations_setup.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/services/shared_pref/pref_keys.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';
import 'package:shopify/core/styles/theme/app_theme.dart';

class Shopify extends StatelessWidget {
  const Shopify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AppCubit>()
            ..changeAppThemeMode(
              sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
            ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final cubit = context.read<AppCubit>();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: const Locale('en', 'US'),
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                theme: cubit.isDark ? themeLight() : themeDark(),
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: AppRoutes.login,
              );
            },
          ),
        ),
      ),
    );
  }
}
