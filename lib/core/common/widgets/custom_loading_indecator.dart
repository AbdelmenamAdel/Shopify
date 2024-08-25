import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: LoadingIndicator(
        indicatorType: Indicator.lineScalePulseOut,
        colors: [Colors.white],
        strokeWidth: .5,
      ),
    );
  }
}
