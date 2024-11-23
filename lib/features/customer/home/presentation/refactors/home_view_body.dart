import 'package:flutter/material.dart';
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
          const SliverToBoxAdapter(
            child: BannerSliders(
              bannersList: [
                'https://img.freepik.com/premium-vector/cyber-monday-sale-neon-banner-design-vector-illustration-shopping-promotion_520826-2162.jpg',
                'https://img.freepik.com/free-vector/flat-landing-page-template-cyber-monday-sale_23-2150903085.jpg',
                'https://img.freepik.com/premium-vector/social-media-banner-social-media-template_607096-58.jpg?w=900',
              ],
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
