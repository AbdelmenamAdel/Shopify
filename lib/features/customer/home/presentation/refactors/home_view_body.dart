import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/loading/loading_shimmer.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_all_categories/get_all_categories_bloc.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_all_products/get_all_products_bloc.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_banners/get_banners_bloc.dart';
import 'package:shopify/features/customer/home/presentation/widgets/banners/banner_sliders.dart';
import 'package:shopify/features/customer/home/presentation/widgets/categories/categories_list.dart';
import 'package:shopify/features/customer/home/presentation/widgets/categories/categories_shimmer.dart';
import 'package:shopify/features/customer/home/presentation/widgets/products/products_list.dart';
import 'package:shopify/features/customer/home/presentation/widgets/products/products_shimmer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetBannersBloc>().add(const GetBannersEvent.getBanners());
        context
            .read<GetAllCategoriesBloc>()
            .add(const GetAllCategoriesEvent.getAllCategories());
        context
            .read<GetAllProductsBloc>()
            .add(const GetAllProductsEvent.getAllProducts());
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          // Static header
          SliverToBoxAdapter(
            child: BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoadingShimmer(
                        height: 170.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  success: (imageBannerList) {
                    return BannerSliders(
                      bannersList: imageBannerList,
                    );
                  },
                  empty: () {
                    return Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    );
                  },
                  error: (error) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 48),
                          Text(
                            'An error occurred:\n$error',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Trigger retry logic
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
              builder: (context, state) {
                return state.when(
                  success: (categoriesList) {
                    return CategoriesList(
                      categoreisList: categoriesList,
                    );
                  },
                  loading: () => const CategoriesShimmer(),
                  empty: () {
                    return Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    );
                  },
                  error: (error) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 48),
                          Text(
                            'An error occurred:\n$error',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Trigger retry logic
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
            builder: (context, state) {
              return state.when(
                success: (productsList) {
                  return ProductsList(
                    productList: productsList,
                  );
                },
                loading: () =>
                    const SliverToBoxAdapter(child: ProductShimmer()),
                empty: () {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
                error: (error) {
                  return SliverToBoxAdapter(child: Text('Error: $error'));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
//  SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 // Alternate between item and separator
//                 if (index.isOdd) {
//                   return const SizedBox(height: 10); // Separator
//                 }
//                 final itemIndex = index ~/ 2; // Actual item index
//                 return Container(
//                   height: 50,
//                   width: double.infinity,
//                   color: Colors.red,
//                   child: Center(child: Text('Item $itemIndex')),
//                 );
//               },
//               childCount: 50 * 2 + 1, // Items + separators
//             ),
//           ),