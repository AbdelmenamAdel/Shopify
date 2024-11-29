import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/common/widgets/customer_app_bar.dart';
import 'package:shopify/core/dependancy_injection/injection_container.dart';
import 'package:shopify/features/customer/categories/presentation/managers/get_category/get_category_bloc.dart';
import 'package:shopify/features/customer/categories/presentation/refactors/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({required this.categoryInfo, super.key});
  final ({String categoryName, int categoryId}) categoryInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCategoryBloc>()
        ..add(
          GetCategoryEvent.getCategory(categoryId: categoryInfo.categoryId),
        ),
      child: Scaffold(
        appBar: CustomAppBar(title: categoryInfo.categoryName),
        body: const CategoryViewBody(),
      ),
    );
  }
}
