import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shopify/core/app/app_cubit/app_cubit.dart';
import 'package:shopify/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopify/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:shopify/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/dio_factory.dart';
import 'package:shopify/features/admin/categories/data/data_source/categories_admin_data_sourse.dart';
import 'package:shopify/features/admin/categories/data/repos/categoreis_admin_repos.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/categories_count/categories_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/products_count/products_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/users_count/users_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/data/data_source/dashboard_data_sourse.dart';
import 'package:shopify/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:shopify/features/admin/notifications/data/models/data_source/add_notificaion_data_source.dart';
import 'package:shopify/features/admin/notifications/data/models/repos/add_notification_repo.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:shopify/features/admin/notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:shopify/features/admin/products/data/data_source/products_admin_data_source.dart';
import 'package:shopify/features/admin/products/data/repos/products_admin_repo.dart';
import 'package:shopify/features/admin/products/presentation/bloc/create_product/create_prodcut_bloc.dart';
import 'package:shopify/features/admin/products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:shopify/features/admin/products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:shopify/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:shopify/features/admin/users/data/data_source/users_data_source.dart';
import 'package:shopify/features/admin/users/data/repos/users_repo.dart';
import 'package:shopify/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:shopify/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:shopify/features/auth/data/data_source/auth_data_source.dart';
import 'package:shopify/features/auth/data/repos/auth_repo.dart';
import 'package:shopify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopify/features/customer/home/data/data_source/banners_data_source.dart';
import 'package:shopify/features/customer/home/data/repo/home_repo.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_all_categories/get_all_categories_bloc.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_all_products/get_all_products_bloc.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_banners/get_banners_bloc.dart';
import 'package:shopify/features/customer/main/presentation/manager/cubit/main_cubit.dart';
import 'package:shopify/features/customer/profile/data/data_source/profile_data_source.dart';
import 'package:shopify/features/customer/profile/data/repos/profile_repo.dart';
import 'package:shopify/features/customer/profile/presentation/bloc/profile/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashBoard();
  await _initCategoriesAdmin();
  await _initProductsAdmin();
  await _initUsersAdmin();
  await _initPushNotification();
  await _initMain();
  await _initProfile();
  await _initHome();
  // await _initProductDetails();
  // await _initCategory();
  // await _initProductsViewAll();
  // await _initSearch();
  // await _initFavorites();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
  // ..registerFactory(ShareCubit.new)
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}

Future<void> _initDashBoard() async {
  sl
    ..registerLazySingleton(() => DashBoardDataSourse(sl()))
    ..registerLazySingleton(() => DashBoardRepo(sl()))
    ..registerFactory(() => ProductsCountBloc(sl()))
    ..registerFactory(() => CategoriesCountBloc(sl()))
    ..registerFactory(() => UsersCountBloc(sl()));
}

Future<void> _initCategoriesAdmin() async {
  sl
    ..registerLazySingleton(() => CategoreisAdminRepo(sl()))
    ..registerLazySingleton(() => CategoriesAdminDataSource(sl()))
    ..registerFactory(() => GetAllAdminCategoriesBloc(sl()))
    ..registerFactory(() => CreateCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerFactory(() => UpdateCategoryBloc(sl()));
}

Future<void> _initProductsAdmin() async {
  sl
    ..registerLazySingleton(() => ProductsAdminRepo(sl()))
    ..registerLazySingleton(() => ProductsAdminDataSource(sl()))
    ..registerFactory(() => GetAllAdminProductsBloc(sl()))
    ..registerFactory(() => CreateProdcutBloc(sl()))
    ..registerFactory(() => DeleteProductBloc(sl()))
    ..registerFactory(() => UpdateProductBloc(sl()));
}

Future<void> _initUsersAdmin() async {
  sl
    ..registerLazySingleton(() => UsersRepo(sl()))
    ..registerLazySingleton(() => UsersDataSource(sl()))
    ..registerFactory(() => GetAllUsersBloc(sl()))
    ..registerFactory(() => DeleteUserBloc(sl()));
}

Future<void> _initPushNotification() async {
  sl
    ..registerFactory(AddNotificationBloc.new)
    ..registerFactory(GetAllNotificationAdminBloc.new)
    ..registerFactory(() => SendNotificationBloc(sl()))
    ..registerLazySingleton(() => AddNotificationRepo(sl()))
    ..registerLazySingleton(AddNotificationDataSource.new);
}

Future<void> _initMain() async {
  sl.registerFactory(MainCubit.new);
}

Future<void> _initProfile() async {
  sl
    ..registerFactory(() => ProfileBloc(sl()))
    ..registerLazySingleton(() => ProfileRepo(sl()))
    ..registerLazySingleton(() => ProfileDataSource(sl()));
}

Future<void> _initHome() async {
  sl
    ..registerFactory(() => GetBannersBloc(sl()))
    ..registerFactory(() => GetAllCategoriesBloc(sl()))
    ..registerFactory(() => GetAllProductsBloc(sl()))
    ..registerLazySingleton(() => HomeRepo(sl()))
    ..registerLazySingleton(() => BannersDataSource(sl()));
}

// Future<void> _initProductDetails() async {
//   sl
//     ..registerFactory(() => ProductDetailsBloc(sl()))
//     ..registerLazySingleton(() => ProductDetailsRepo(sl()))
//     ..registerLazySingleton(() => ProductDetailsDataSource(sl()));
// }

// Future<void> _initCategory() async {
//   sl
//     ..registerFactory(() => GetCategoryBloc(sl()))
//     ..registerLazySingleton(() => CatgeoryRepo(sl()))
//     ..registerLazySingleton(() => CatgeoryDataSource(sl()));
// }

// Future<void> _initProductsViewAll() async {
//   sl
//     ..registerFactory(() => ProductsViewAllBloc(sl()))
//     ..registerLazySingleton(() => ProductsViewAllRepo(sl()))
//     ..registerLazySingleton(() => ProductsViewAllDataSource(sl()));
// }

// Future<void> _initSearch() async {
//   sl
//     ..registerFactory(() => SearchBloc(sl()))
//     ..registerLazySingleton(() => SearchRepo(sl()))
//     ..registerLazySingleton(() => SearchDataSource(sl()));
// }

// Future<void> _initFavorites() async {
//   sl.registerFactory(FavoritesCubit.new);
// }
