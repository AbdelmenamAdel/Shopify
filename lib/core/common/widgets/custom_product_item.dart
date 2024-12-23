import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/app/share/share_cubit.dart';
import 'package:shopify/core/common/widgets/custom_container_linear_customer.dart';
import 'package:shopify/core/common/widgets/custom_favorite_button.dart';
import 'package:shopify/core/common/widgets/custom_share_button.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/extensions/string_exetension.dart';
import 'package:shopify/core/routes/app_routes.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/customer/favorites/data/models/favorites_model.dart';
import 'package:shopify/features/customer/favorites/presentation/manager/cubit/favorites_cubit.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final double price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(AppRoutes.productDetails, arguments: productId);
      },
      child: CustomContainerLinearCustomer(
        height: 250.h,
        width: 165.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Share Button
                BlocBuilder<ShareCubit, ShareState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () {
                        return CustomShareButton(
                          size: 25,
                          onTap: () {
                            context.read<ShareCubit>().sendDynamicLinkProduct(
                                  imageUrl: imageUrl,
                                  productId: productId,
                                  title: title,
                                );
                          },
                        );
                      },
                      loading: (id) {
                        if (id == productId) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: SizedBox(
                              height: 25.h,
                              width: 25.w,
                              child: CircularProgressIndicator(
                                color: context.color.bluePinkLight,
                              ),
                            ),
                          );
                        }
                        return CustomShareButton(
                          size: 25,
                          onTap: () {},
                        );
                      },
                      success: () {
                        return CustomShareButton(
                          size: 25,
                          onTap: () {
                            context.read<ShareCubit>().sendDynamicLinkProduct(
                                  imageUrl: imageUrl,
                                  productId: productId,
                                  title: title,
                                );
                          },
                        );
                      },
                    );
                  },
                ),
                //Favorite Button
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return CustomFavoriteButton(
                      size: 25,
                      isFavorites: context
                          .read<FavoritesCubit>()
                          .isFavorite(productId.toString()),
                      onTap: () async {
                        final model = FavoritesModel(
                          id: productId.toString(),
                          title: title,
                          image: imageUrl,
                          price: price.toString(),
                          categoryName: categoryName,
                        );
                        await context
                            .read<FavoritesCubit>()
                            .addAndRemoveFavorite(
                              model,
                            );
                      },
                    );
                  },
                ),
              ],
            ),

            // Show Image
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  height: 200.h,
                  width: 120.w,
                  imageUrl: imageUrl.imageProductFormate(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 70,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: title,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Category Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: categoryName,
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
