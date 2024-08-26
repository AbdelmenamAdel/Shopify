import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/categories_count/categories_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCountBloc, CategoriesCountState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const DashboardContainer(
              title: 'Categories',
              number: '0',
              image: AppImages.categoriesDrawer,
              isLoading: true,
            );
          },
          success: (String count) {
            return DashboardContainer(
              title: 'Categories',
              number: count,
              image: AppImages.categoriesDrawer,
              isLoading: false,
            );
          },
          failure: (String error) {
            return TextApp(
              text: error,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                color: Colors.red,
              ),
            );
          },
        );
      },
    );
  }
}
