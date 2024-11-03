import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopify/core/common/screens/custom_web_view.dart';
import 'package:shopify/core/common/screens/under_build_screen.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/routes/base_routes.dart';
import 'package:shopify/features/admin/home/presentation/views/home_admin_view.dart';
import 'package:shopify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopify/features/auth/presentation/views/login_view.dart';
import 'package:shopify/features/auth/presentation/views/sign_up_view.dart';
import 'package:shopify/features/customer/main/presentation/views/customer_main_view.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String homeAdmin = 'homeAdmin';
  static const String mainCustomer = 'main-screen';
  static const String webview = 'webView';
  static const String productDetails = 'product-details';
  static const String category = 'catgeory';
  static const String productsViewAll = 'productsViewAll';
  static const String search = 'search';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginView(),
          ),
        );
      case signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
            ],
            child: const SignUpView(),
          ),
        );
      case homeAdmin:
        return BaseRoute(page: const HomeAdminView());
      case mainCustomer:
        return BaseRoute(page: const CustomerMainView());
      case webview:
        return BaseRoute(
          page: CustomWebView(
            url: args! as String,
          ),
        );
      //   case productDetails:
      //     return BaseRoute(
      //       page: ProductDetailsScreen(
      //         productId: args! as int,
      //       ),
      //     );
      //   case category:
      //     return BaseRoute(
      //       page: CatgeoryScreen(
      //         categoryInfo: args! as ({int categoryId, String categoryName}),
      //       ),
      //     );
      //   case productsViewAll:
      //     return BaseRoute(
      //       page: const ProductsViewAllScreen(),
      //     );
      //   case search:
      //     return BaseRoute(
      //       page: const SearchScreen(),
      //     );

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
