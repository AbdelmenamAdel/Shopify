import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/app/share/share_cubit.dart';
import 'package:shopify/core/common/widgets/custom_favorite_button.dart';
import 'package:shopify/core/common/widgets/custom_share_button.dart';
import 'package:shopify/core/common/widgets/text_app.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/styles/fonts/font_weight_helper.dart';
import 'package:shopify/features/customer/favorites/data/models/favorites_model.dart';
import 'package:shopify/features/customer/favorites/presentation/manager/cubit/favorites_cubit.dart';
import 'package:shopify/features/customer/product_details/models/product_details_response.dart';
import 'package:shopify/features/customer/product_details/presentation/widgets/product_details_image_slider.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({required this.productModel, super.key});
  final ProductDetailsModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // share and favorite button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Share Button

                BlocBuilder<ShareCubit, ShareState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () {
                        return CustomShareButton(
                          size: 30,
                          onTap: () {
                            context.read<ShareCubit>().sendDynamicLinkProduct(
                                  imageUrl: productModel.images.first,
                                  productId:
                                      int.parse(productModel.id.toString()),
                                  title: productModel.title ?? '',
                                );
                          },
                        );
                      },
                      loading: (id) {
                        if (id.toString() == productModel.id) {
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
                          size: 30,
                          onTap: () {},
                        );
                      },
                      success: () {
                        return CustomShareButton(
                          size: 30,
                          onTap: () {
                            context.read<ShareCubit>().sendDynamicLinkProduct(
                                  imageUrl: productModel.images.first,
                                  productId:
                                      int.parse(productModel.id.toString()),
                                  title: productModel.title ?? '',
                                );
                          },
                        );
                      },
                    );
                  },
                ),

                // Favorite Button
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return CustomFavoriteButton(
                      size: 30,
                      isFavorites: context
                          .read<FavoritesCubit>()
                          .isFavorite(productModel.id ?? ''),
                      onTap: () async {
                        final model = FavoritesModel(
                          id: productModel.id ?? '',
                          title: productModel.title ?? '',
                          image: productModel.images.first,
                          price: productModel.price.toString(),
                          categoryName: productModel.category!.name,
                        );
                        await context
                            .read<FavoritesCubit>()
                            .addAndRemoveFavorite(model);
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            //Image
            ProductDetailsImageSlider(
              imageList: productModel.images,
            ),

            SizedBox(height: 30.h),
            //Title
            TextApp(
              text: productModel.title ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 15.h),
            //description
            TextApp(
              text: productModel.description ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor,
                height: 1.5,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
