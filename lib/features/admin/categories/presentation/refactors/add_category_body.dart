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
import 'package:shopify/features/admin/categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopify/features/admin/categories/presentation/refactors/create_category_section.dart';
import 'package:shopify/features/admin/categories/presentation/widgets/add_category_item.dart';

class AddCategoryBody extends StatefulWidget {
  const AddCategoryBody({super.key});

  @override
  State<AddCategoryBody> createState() => _AddCategoryBodyState();
}

class _AddCategoryBodyState extends State<AddCategoryBody> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleRefresh() {
    final completer = Completer<void>();

    Timer(
      const Duration(seconds: 1),
      completer.complete,
    );
    setState(() {
      context.read<GetAllAdminCategoriesBloc>().add(
            const GetAllAdminCategoriesEvent.fetchAdminCategories(
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
              child: CreateCategorySection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<GetAllAdminCategoriesBloc,
                  GetAllAdminCategoriesState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return LoadingShimmer(
                            height: 130.h,
                            borderRadius: 15,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: 4,
                      );
                    },
                    success: (list) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AddCatgeoryItem(
                            name: list.categoriesGetAllList[index].name ?? '',
                            categoryId:
                                list.categoriesGetAllList[index].id ?? '',
                            image: list.categoriesGetAllList[index].image ?? '',
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: list.categoriesGetAllList.length,
                      );
                    },
                    empty: EmptyScreen.new,
                    error: Text.new,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
