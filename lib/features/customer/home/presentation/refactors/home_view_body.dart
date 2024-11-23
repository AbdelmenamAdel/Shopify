import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Simulate a refresh action
        await Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          // Static header
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.red,
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
