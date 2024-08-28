import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/admin_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/refactors/add_category_body.dart';

class AddCategoriesView extends StatelessWidget {
  const AddCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllAdminCategoriesBloc>()
            ..add(
              const GetAllAdminCategoriesEvent.fetchAdminCategories(
                isNotLoading: true,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<DeleteCategoryBloc>(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Categories',
        ),
        body: AddCategoryBody(),
      ),
    );
  }
}
