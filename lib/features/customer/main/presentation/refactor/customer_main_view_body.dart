import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/core/enums/nav_bar_enum.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/features/customer/categories/categories_view.dart';
import 'package:shopify/features/customer/favorites/favorites_view.dart';
import 'package:shopify/features/customer/home/presentation/views/home_view.dart';
import 'package:shopify/features/customer/main/presentation/manager/cubit/main_cubit.dart';
import 'package:shopify/features/customer/main/presentation/refactor/bottom_nav_bar.dart';
import 'package:shopify/features/customer/profile/presentation/views/profile_view.dart';

class CustomerMainViewBody extends StatelessWidget {
  const CustomerMainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.homeBg!),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                final cubit = context.read<MainCubit>();
                if (cubit.navBarEnum == NavBarEnum.categories) {
                  return const CategoriesView();
                } else if (cubit.navBarEnum == NavBarEnum.favorites) {
                  return const FavoritesView();
                } else if (cubit.navBarEnum == NavBarEnum.profile) {
                  return const ProfileView();
                } else {
                  return const HomeView();
                }
              },
            ),
          ),
          const MainBottomNavBar(),
        ],
      ),
    );
  }
}
