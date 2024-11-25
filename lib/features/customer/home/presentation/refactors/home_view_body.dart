import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/core/common/loading/loading_shimmer.dart';
import 'package:shopify/features/customer/home/presentation/managers/get_banners/get_banners_bloc.dart';
import 'package:shopify/features/customer/home/presentation/widgets/banners/banner_sliders.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Simulate a refresh action
        await Future<void>.delayed(const Duration(seconds: 1)); //+
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
                    return const SizedBox.shrink();
                  },
                  error: (error) {
                    return Text('Error: $error');
                  },
                );
              },
            ),
          ),
          // List with separators
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Alternate between item and separator
                if (index.isOdd) {
                  return const SizedBox(height: 10); // Separator
                }
                final itemIndex = index ~/ 2; // Actual item index
                return Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.red,
                  child: Center(child: Text('Item $itemIndex')),
                );
              },
              childCount: 50 * 2 + 1, // Items + separators
            ),
          ),
        ],
      ),
    );
  }
}
