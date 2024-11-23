import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/animations/animate_do.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/features/customer/home/presentation/refactors/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.bounceInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeViewBody(
          scrollController: scrollController,
        ),
        CustomFadeInLeft(
          duration: 200,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: FloatingActionButton(
                onPressed: scrollUp,
                backgroundColor: context.color.bluePinkLight,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
