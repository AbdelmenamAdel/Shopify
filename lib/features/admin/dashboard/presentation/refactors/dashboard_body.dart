import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shopify/core/common/widgets/custom_notifier.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/colors/colors_dark.dart';
import 'package:shopify/core/styles/images/app_images.dart';
import 'package:shopify/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
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
      // documentId = context.read<IdProvider>().getDocumentId();
      // docId = context.read<IdProvider>().getData;
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
        child: ListView(
          children: const [
            DashboardContainer(
              title: 'Products',
              number: '0',
              image: AppImages.productsDrawer,
              isLoading: false,
            ),
            DashboardContainer(
              title: 'Categories',
              number: '0',
              image: AppImages.categoriesDrawer,
              isLoading: false,
            ),
            DashboardContainer(
              title: 'Users',
              number: '0',
              image: AppImages.usersDrawer,
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
