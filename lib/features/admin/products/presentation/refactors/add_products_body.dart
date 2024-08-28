import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shopify/core/common/loading/empty_screen.dart';
import 'package:shopify/core/common/loading/loading_shimmer.dart';
import 'package:shopify/core/common/widgets/custom_notifier.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/features/admin/products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:shopify/features/admin/products/presentation/refactors/create_product_section.dart';
import 'package:shopify/features/admin/products/presentation/widgets/product_admin_item.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProaductBodyState();
}

class _AddProaductBodyState extends State<AddProductBody> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() {
    final completer = Completer<void>();

    Timer(
      const Duration(seconds: 1),
      completer.complete,
    );
    setState(() {
      context.read<GetAllAdminProductsBloc>().add(
            const GetAllAdminProductsEvent.getAllProducts(
              isNotLoading: true,
            ),
          );
    });
    return completer.future.then<void>(
      (_) {
        showAchievementView(
          context: context,
          title: 'Click to refresh again',
          onTap: () {
            _refreshIndicatorKey.currentState!.show();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      key: _refreshIndicatorKey,
      onRefresh: _handleRefresh,
      showChildOpacityTransition: false,
      backgroundColor: context.color.mainColor,
      color: ColorsDark.blueDark.withOpacity(.5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CreateProductSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<GetAllAdminProductsBloc,
                  GetAllAdminProductsState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //Number of cloums
                          crossAxisSpacing: 8, // Spacing between colums
                          mainAxisSpacing: 15, //Spacing between rows
                          childAspectRatio: .7,
                        ),
                        itemBuilder: (context, index) {
                          return LoadingShimmer(
                            height: 220.h,
                            width: 165.w,
                          );
                        },
                      );
                    },
                    success: (list) {
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //Number of cloums
                          crossAxisSpacing: 8, // Spacing between colums
                          mainAxisSpacing: 15, //Spacing between rows
                          childAspectRatio: .7,
                        ),
                        itemBuilder: (context, index) {
                          return ProductAdminItem(
                            imageUrl: list[index].images!.first,
                            productId: list[index].id ?? '',
                            categoryName: list[index].category!.name ?? '',
                            price: list[index].price.toString(),
                            title: list[index].title ?? '',
                            imageList: list[index].images ?? [],
                            description: list[index].description ?? '',
                            categoryId: list[index].category!.id ?? '',
                          );
                        },
                      );
                    },
                    empty: EmptyScreen.new,
                    error: Text.new,
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
          ],
        ),
      ),
    );
  }
}
