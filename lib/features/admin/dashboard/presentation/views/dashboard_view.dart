import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/categories_count/categories_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/products_count/products_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/users_count/users_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCountBloc>(
          create: (context) => sl<ProductsCountBloc>()
            ..add(const ProductsCountEvent.getProductsCount()),
        ),
        BlocProvider<CategoriesCountBloc>(
          create: (context) => sl<CategoriesCountBloc>()
            ..add(const CategoriesCountEvent.getCategoriesCount()),
        ),
        BlocProvider<UsersCountBloc>(
          create: (context) =>
              sl<UsersCountBloc>()..add(const UsersCountEvent.getUsersCount()),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Dashboard',
        ),
        body: DashboardBody(),
      ),
    );
  }
}
