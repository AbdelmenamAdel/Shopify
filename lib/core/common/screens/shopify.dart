import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/app/app_cubit/app_cubit.dart';
import 'package:shopify/core/app/share/share_cubit.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/language/app_localizations_setup.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/services/shared_pref/pref_keys.dart';
import 'package:shopify/core/services/shared_pref/shared_pref.dart';
import 'package:shopify/core/styles/theme/app_theme.dart';
import 'package:shopify/features/customer/favorites/presentation/manager/cubit/favorites_cubit.dart';

class Shopify extends StatelessWidget {
  const Shopify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<FavoritesCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ShareCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AppCubit>()
            ..changeAppThemeMode(
              sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
            )
            ..getSavedLanguage(),
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
                locale: Locale(cubit.currentLangCode),
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                theme: cubit.isDark ? themeLight() : themeDark(),
                navigatorKey: sl<GlobalKey<NavigatorState>>(),
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute:
                    SharedPref().getString(PrefKeys.accessToken) != null
                        ? SharedPref().getString(PrefKeys.userRole) == 'admin'
                            ? AppRoutes.homeAdmin
                            : SharedPref().getString(PrefKeys.userRole) ==
                                    'customer'
                                ? AppRoutes.mainCustomer
                                : AppRoutes.login
                        : AppRoutes.login,
              );
            },
          ),
        ),
      ),
    );
  }
}
