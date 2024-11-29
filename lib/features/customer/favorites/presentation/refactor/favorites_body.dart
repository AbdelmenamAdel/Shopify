import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/widgets/custom_product_item.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/customer/favorites/presentation/manager/cubit/favorites_cubit.dart';

class FavorietsBody extends StatelessWidget {
  const FavorietsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (context.read<FavoritesCubit>().favoritesList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: context.color.textColor,
                  size: 150,
                ),
                TextApp(
                  text: 'Choose Your Favorite Products',
                  theme: context.textStyle.copyWith(
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: context.read<FavoritesCubit>().favoritesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Number of cloums
              crossAxisSpacing: 8, // Spacing between colums
              mainAxisSpacing: 15, //Spacing between rows
              childAspectRatio: 165 / 250,
            ),
            itemBuilder: (context, index) {
              final list = context.read<FavoritesCubit>().favoritesList;
              return CustomProductItem(
                price: double.parse(list[index].price),
                categoryName: list[index].categoryName,
                title: list[index].title,
                imageUrl: list[index].image,
                productId: int.parse(list[index].id),
              );
            },
          );
        },
      ),
    );
  }
}
