import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/features/admin/dashboard/data/bloc/products_count/products_count_bloc.dart';
import 'package:shopify/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCountBloc, ProductsCountState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const DashboardContainer(
              title: 'Products',
              number: '',
              image: AppImages.productsDrawer,
              isLoading: true,
            );
          },
          success: (String count) {
            return DashboardContainer(
              title: 'Products',
              number: count,
              image: AppImages.productsDrawer,
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
